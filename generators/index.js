
const createStrapi = require('strapi');
const { execSync } = require("child_process");
const util = require('util');

const runGenerator = async () => {
  createStrapi();
  // console.debug("strapi?", strapi.config);
  
  strapi.config.functions.cron = false;// disable cron in this file
  strapi.config.database.connections.default.options.debug = false
  await strapi.load();

  for (var table of Object.keys(strapi.models)) {
    if ((table.startsWith('strapi_') && 
      !['strapi_administrator', 'strapi_role', 'strapi_users_roles'].includes(table) )|| table == 'core_store') {
      continue;//skip strapi table
    }
    const contentConfigStr = await strapi.query("core_store").findOne({ key: `plugin_content_manager_configuration_content_types::application::${table}.${table}`});
    if (contentConfigStr == null) {
      throw Error(`Unable to find content configuration for ${table}`);
    }
    console.debug('table raw config', table, contentConfigStr.value);
    const contentConfig = JSON.parse(contentConfigStr.value);

    // console.debug("table", table);
    const fields = [];
    const strapiModel = strapi.models[table];
    const tableLabel= strapiModel.info.name;
    const attrs = strapiModel.attributes;
    // console.debug('field', table, attrs);
    for (var field of Object.keys(attrs)) {
      const attr = attrs[field];
      console.debug('field', table, field, attr);
      let fieldType = attr.type;
      const fieldConfig = { name: field, type: fieldType, required: attr.required ? true : false };

      if (fieldType == 'enumeration' || fieldType == 'enum') {
        fieldConfig.options = attr.enum;
      }

      if (fieldType == undefined || fieldType == 'null') {
        if (attr.model) {
          fieldType = '_single';
        } else if (attr.collection) {
          fieldType = '_collection';
        }
        // console.debug("is relation", attr);
      }
      
      if (fieldType == undefined || fieldType == 'null') {
        throw Error(`Empty type ${table}.${field} ${util.inspect(attr, false, 4)}`);
      }

      fieldConfig.type = fieldType;

      fields.push(fieldConfig);
    }

    fields.push({name: 'created_at', type: 'datetime', required: false, label: 'Created at'});
    fields.push({name: 'updated_at', type: 'datetime', required: false, label: 'Updated at'});

    // already exists in meta
    // if (strapiModel.options.draftAndPublish) {
    //   fields.push({name: 'published_at', type: 'datetime', required: false, label: 'Publish at'});
    // }

    const fieldStrArray = fields.map((field) => {
      return `${field.name}:'${JSON.stringify(field)}'`;
    })

    const jsonTableConfig = JSON.stringify(contentConfig.settings);
    const yoCmd = `yo strapi-vuesax-form ${table}:${tableLabel}:'${jsonTableConfig}' ${fieldStrArray.join(' ')}`;
    console.debug('executing:', yoCmd);
    const res = execSync(yoCmd);
    console.debug('result', res.toString());
  }

  console.info("Done.");
}


runGenerator();