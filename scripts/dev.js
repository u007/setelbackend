

const createStrapi = require('strapi');

process.on('message', (msg) => {
  console.log('Message from strapi:', msg);
});
process.on('reload', (msg) => {
  console.log('reload from strapi:', msg);
});

run = () => {
  setTimeout(() => {
    const res = createStrapi({
      autoReload: true
    });
    res.start()
  }, 100);
}

run();