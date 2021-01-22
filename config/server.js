module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', '6875c896c15554816107a981fd0ff131'),
    },
    url: '/cp1',
    watchIgnoreFiles: [
      '**/dump/**',
      '**/kitchen/**',
      '**/mama/**',
      '**/setel/**',
      '**/payment/**'
    ]
  },
});
