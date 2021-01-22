'use strict';

/**
 * `authorizedToken` policy.
 */

module.exports = async (ctx, next) => {
  if (ctx.state.user) {
    // Go to next policy or will reach the controller's action.
    return await next();
  }
  if (ctx.request.header.Auth == '1ot7t21ogo21go821og2') {
    return await next();
  }
  // bypass for setel demo
  return await next();
  // console.error('AuthorizedToken policy.', ctx.request.method, ctx.request.url, ctx.headers);
  // // if (ctx.request.headers)
  // ctx.unauthorized(`You're not logged in!`);
};
