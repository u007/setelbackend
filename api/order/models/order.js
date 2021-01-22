'use strict';
const axios = require('axios');
const { makeid } = require('../../../util/string');
const moment = require('moment');
const util = require('util');
/**
 * Read the documentation (https://strapi.io/documentation/v3.x/concepts/models.html#lifecycle-hooks)
 * to customize this model
 */

const onSaveOrder = async function (id, data) {
  console.debug('onSaveOrder', id, data);
  const isNew = id !== null
  let sales_total = 0.0;
  let tax_total = 0.0;
  if (!data.order_id) {
    data.order_id = makeid(10);
  }
  let oldData = {};
  if (id) {
    oldData = await strapi.query('order').findOne({ id: id._id });
  }

  // validate status
  if (!isNew) {
    if (oldData.state !== data.state) {
      switch (oldData.state) {
        case 'created':
          if (!['confirmed', 'cancelled'].includes(data.state)) {
            throw Error('State not allowed');
          }
          break
        case 'confirmed':
          if (!['delivered', 'cancelled'].includes(data.state)) {
            throw Error('State not allowed');
          }
          break
        case 'cancelled':
          throw Error('State not allowed');
        case 'delivered':
          throw Error('State not allowed');
      }
    }
  }


  let addonTotal = 0.0;
  let optionTotal = 0.0;
  let pointTotal = 0.0;
  let discountSellerTotal = 0.0;
  let discountPlatformTotal = 0.0;

  // only process when updated or new data has items
  if (data.items) {
    for (let c = 0; c < data.items.length; c++) {
      let item = data.items[c];
      let itemAddOnTotal = 0.0;
      let itemOptionAdjustment = 0.0;
      let food = { AddOns: [], Options: [] };
      if (item.food_menu) {
        food = await strapi.query('food-menu').findOne({ id: item.food_menu });
        // console.log('found food', food);
        if (food != null) {
          data.items[c].sku = food.sku;
          data.items[c].name = food.name;
          data.items[c].selling_price = food.selling_price;
          data.items[c].retail_price = food.retail_price;
          data.items[c].tax = food.tax;
          data.items[c].tax_included = food.tax_included;
          data.items[c].point = food.point
          item = data.items[c];
        }
      }// sku in item
  
      console.debug("onSaveOrder item", item);
  
      if (item.addon) {
        for (let d = 0; d < item.addon.length; d++) {
          const addon = item.addon[d];
          if (addon.sku == undefined || addon.sku == null || addon.sku == '') {
            throw Error(`Invalid addon sku ${addon.sku} on addon ${d + 1}`);
          }
  
          let foundAddon = false;
          const addonSKU = addon.sku;
          for (var e = 0; e < food.AddOns.length; e++) {
            const foodAddon = food.AddOns[e];
            if (foodAddon.sku == addonSKU) {
              addon.selling_price = foodAddon.selling_price;
              addon.name = foodAddon.name;
              foundAddon = true;
            }
          }
  
          if (!foundAddon) {
            throw Error(`Addon sku ${addon.sku} missing`);
          }
          itemAddOnTotal += addon.selling_price;
        }
        itemAddOnTotal *= item.quantity;
      }
      console.debug("food", food);
      if (item.option) {
        for (let d = 0; d < item.option.length; d++) {
          const option = item.option[d];
          if (option.sku == undefined || option.sku == null || option.sku == '') {
            throw Error(`Invalid option sku ${option.sku} on option ${d + 1}`);
          }
          let foundOption = false;
          for (var e = 0; e < food.Options.length; e++) {
            const foodOption = food.Options[e];
            console.debug('checking option', foodOption);
            if (foodOption.sku == option.sku) {
              option.price_adjustment = foodOption.price_adjustment;
              foundOption = true;
              option.name = foodOption.name;
              break;
            }
          }
  
          if (!foundOption) {
            throw Error(`Option sku ${option.sku} missing`);
          }
  
          if (option.price_adjustment == undefined || option.price_adjustment == null) {
            continue;// no adjustment
          }
  
          itemOptionAdjustment += option.price_adjustment;
        }
        itemOptionAdjustment *= item.quantity;
      }
  
  
      let discountItemTotal = 0.0;
      if (item.discount_seller) {
        discountSellerTotal += item.discount_seller;
        discountItemTotal += item.discount_seller;
      }
      if (item.discount_platform) {
        discountPlatformTotal += item.discount_platform;
        discountItemTotal += item.discount_platform;
      }
  
      data.items[c].discount_total = discountItemTotal;
      data.items[c].addon_total = itemAddOnTotal;
      data.items[c].option_total = itemOptionAdjustment;
  
      let salesItemTotal = item.selling_price * item.quantity;
      
      console.debug('salesItemTotal', salesItemTotal);
      data.items[c].sales_total = salesItemTotal;
  
      pointTotal += data.items[c].point ? data.items[c].point * item.quantity : 0.0
      addonTotal += itemAddOnTotal;
      optionTotal += itemOptionAdjustment;
      tax_total += item.tax * item.quantity;
  
  
      sales_total += salesItemTotal;
    }// each items
  }
  

  console.debug("saving?", util.inspect(data.items, false, 4));
  if (!data.order_at && data.state != 'cart') {
    data.order_at = moment().utc().toDate();
  }

  if (data.items) {
    data.discount_seller = discountSellerTotal;
    data.discount_platform = discountPlatformTotal;
    data.discount_total = discountSellerTotal + discountPlatformTotal;
    data.point_total = pointTotal;
    data.addon_total = addonTotal;
    data.sales_total = sales_total + addonTotal + optionTotal;
    data.tax = tax_total;
  }

  // data.shipping_fee
  // data.tax
  // data.paid_total
  return data;
}

const afterCreateOrder = async (data) => {
  if (data.paid == false) {
    try {
      const res = await axios({
        headers: {
          Auth: '1y2612872l21lD'
        },
        url: 'http://127.0.0.1:8090/api/v1/payment',
        method: 'POST',
        data: {
          orderID: data.id,
          amount: data.sales_total
        },
      });
      if (res.status == 'success') {
        data.paid_total += res.amount;
        if (data.paid_total >= data.sales_total) {
          data.paid = true;
          data.state = 'confirmed'
          await strapi.query('order').update({ id: data.id }, { paid: true, state: 'confirmed', paid_total: data.paid_total });
        }

        //TODO credit system since overpaid
      } else {
        data.state = 'cancelled'
        await strapi.query('order').update({ id: data.id }, { state: 'cancelled' });
      }

      // cannot do this as it will point to actual data such as items[#].food_menu = { id: 123 } instead of 123
      // await strapi.query('order').update({ id: data.id }, data);
      
    } catch (err) {
      console.error('payment failed: ', err);
      throw Error(`Unable to save due to payment issue`);
    }
  }//created n not paid
}

module.exports = {
  lifecycles: {
    async beforeUpdate(id, data) {
      await onSaveOrder(id, data);
    },
    async beforeCreate(data) {
      await onSaveOrder({}, data);
    },

    async afterCreate(data) {
      await afterCreateOrder(data);
    }
  },
};

