Package.describe({
  name: 'smartlinkcom:awsuploader',
  version: '0.2.1',
  // Brief, one-line summary of the package.
  summary: 'Modify slingshot in order to make it easy to upload image files to AWS.',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/smart-link/pkg-awsupload',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.6');
  api.use([
    'coffeescript@2.2.1_1',
    'edgee:slingshot@0.7.1'
  ]);
  api.addFiles([
    'slingshot.coffee',
    'client/slingshot.coffee'
  ], 'client');
  api.addFiles([
    'slingshot.coffee',
    'server/slingshot.coffee'
  ], 'server');
  api.addFiles([
    'exports.js'
  ]);
  api.export([
    'thumbnailUploader',
    'imageUploader',
    'fileUploader'
  ]);
});

