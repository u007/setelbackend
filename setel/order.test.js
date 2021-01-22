// import { loadStrapi } from './misc';
import axios from 'axios';

const util = require('util');
let baseHeader = {
  'Content-Type': 'application/json'
};
const baseURL = "http://127.0.0.1:1337"

test('create order with random payment', async () => {
  // console.debug('baseHeader',baseHeader);
  const countryRow = await retrieveCountry('MY');
  expect(countryRow.id).toBeGreaterThan(0);

  const res = await axios({
    url: `${baseURL}/orders`,
    method: 'post',
    headers: baseHeader,
    data: {
      recipient_name: 'james',
      recipient_address: 'somewhere',
      recipient_state: 'kuala lumpur',
      recipient_country: countryRow.id,
      items: [
        {
          "food_menu": 1,
          "quantity": 2
        }
      ]
    }
  }).then((resp) => resp.data).catch((err) => {
    // console.error(err.response.data)
    if (err.response) {
      // console.error('login error', util.inspect(err.response.data, false, 5));
      throw Error(err.response.data.message);
    }
    throw err;
  });

  expect(res.id).toBeGreaterThan(0);
  console.debug('order', res.id, 'state', res.state);
  expect(['confirmed', 'cancelled'].includes(res.state)).toBeTruthy();

  // expect(sum(1, 2)).toBe(3);
});





const retrieveCountry = async (code) => {
  const res = await axios({
    url: `${baseURL}/countries?_where[code]=${encodeURIComponent(code)}`,
    method: 'get',
    headers: baseHeader
  }).then((res) => res.data).catch((err) => {
    // console.error(err.response.data)
    if (err.response) {
      console.error('retrieveCountry error', util.inspect(err.response.data, false, 5));
      throw Error(err.response.data);
    }
    throw err;
  });
  if (res.length == 0) {
    return null;
  }

  return res[0];
}

const adminLogin = async () => {
  const resp = await axios.post(`${baseURL}/auth/local`, {
    identifier: 'sys1',
    password: '00z0A00!!!!!!',
  }).then((resp) => {
    // console.log('resp', resp);
    return resp;
  }).catch((err) => {
    if (err.response) {
      // console.error('login error', util.inspect(err.response.data, false, 5));
      throw Error(err.response.data.message.map((data) => data.messages.map((msg) => msg.message).join(', ')).join(','));
    }
    throw err;
  });
  if (!resp.data) {
    console.error('invalid login? data missing', resp);
    throw Error(resp);
  }

  const { data } = resp;
  return { jwt: data.jwt, user: data.user };
};

beforeAll(async() => {
  // loadStrapi();
  const auth = await adminLogin();
  // console.debug('auth', auth);
  baseHeader.Authorization = 'Bearer ' + auth.jwt;

  expect(auth.jwt).not.toBeNull();
});