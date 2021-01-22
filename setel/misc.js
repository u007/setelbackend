
let loadedStrapi = false;

export const loadStrapi = async () => {
  if (!loadedStrapi) {
    createStrapi();
    // console.debug("strapi?", strapi.config);
    strapi.config.functions.cron = false;// disable cron in this file
    strapi.config.database.connections.default.options.debug = false
    await strapi.load();
    loadedStrapi = true;
  }
}
