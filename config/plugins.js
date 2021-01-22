


module.exports = ({ env }) => {
  const cloudinaryOption = {
    cloud_name: env('CLOUDINARY_CLOUD_NAME'),
    api_key: env('CLOUDINARY_KEY'),
    api_secret: env('CLOUDINARY_SECRET'),
  };
  // console.log("plugin", cloudinaryOption);
  return {
    // ...
    upload: {
      provider: 'cloudinary',
      providerOptions: cloudinaryOption,
    },
    navigation: {
      additionalFields: ['audience'],
      excludedContentTypes: ["plugins::", "strapi"],
      allowedLevels: 2,
      contentTypesNameFields: {
        'blog_posts': ['altTitle'],
        'pages': ['title'],
      },
    },
    // ...
  }
}