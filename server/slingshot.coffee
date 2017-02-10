generateUUID = ->
  d = new Date().getTime()
  uuid = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, (c) ->
    r = (d + Math.random() * 16) % 16 | 0
    d = Math.floor(d / 16)
    ((if c is "x" then r else (r & 0x7 | 0x8))).toString 16
  )
  uuid.toUpperCase()

Slingshot.createDirective "imageUpload", Slingshot.S3Storage,
  AWSAccessKeyId: Meteor.settings.private.AWS.AWSAccessKeyId
  AWSSecretAccessKey: Meteor.settings.private.AWS.AWSSecretAccessKey
  bucket: Meteor.settings.private.AWS.imageUpload.bucket
  region: Meteor.settings.private.AWS.region
  acl: Meteor.settings.private.AWS.acl
  cdn: Meteor.settings.private.AWS.imageUpload.cdn
  authorize: ->
    #Deny uploads if user is not logged in.
#    unless @userId
#      message = "Please login before posting files"
#      throw new Meteor.Error("Login Required", message)
    true

  key: (file) ->
#   Store file into a directory by the user's id
#    @userId + "/" + generateUUID()
#    new Date().getTime() + '_' + file.name
    generateUUID() + '_' + file.name

Slingshot.createDirective "thumbnailUpload", Slingshot.S3Storage,
  AWSAccessKeyId: Meteor.settings.private.AWS.AWSAccessKeyId
  AWSSecretAccessKey: Meteor.settings.private.AWS.AWSSecretAccessKey
  bucket: Meteor.settings.private.AWS.thumbnailUpload.bucket
  region: Meteor.settings.private.AWS.region
  acl: Meteor.settings.private.AWS.acl
  cdn: Meteor.settings.private.AWS.thumbnailUpload.cdn

  authorize: ->
    true

  key: (file) ->
    new Date().getTime() + '_' + file.name

Slingshot.createDirective "fileUpload", Slingshot.S3Storage,
  AWSAccessKeyId: Meteor.settings.private.AWS.AWSAccessKeyId
  AWSSecretAccessKey: Meteor.settings.private.AWS.AWSSecretAccessKey
  bucket: Meteor.settings.private.AWS.fileUpload.bucket
  region: Meteor.settings.private.AWS.region
  acl: Meteor.settings.private.AWS.acl
  cdn: Meteor.settings.private.AWS.fileUpload.cdn
  authorize: ->
    true

  key: (file) ->
    generateUUID() + '_' + file.name
