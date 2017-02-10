## smartlinkcom:awsuploader
Modify slingshot in order to make it easy to upload image files to AWS.

### Installation
```
meteor add smartlinkcom:awsuploader
```

### Code Snipet:

```
# Image Uploader
imageUploader.send file, (err, downloadUrl) ->
  if error
    console.log "error", error
  else
    console.log 'image upload success, url: ', downloadUrl
    ...
    
# Thumbnail Uploader
thumbnailUploader.send file, (err, downloadUrl) ->
  if error
    console.log "error", error
  else
    console.log 'thumbnail upload success, url: ', downloadUrl
    ...

# File Uploader
fileUploader.send file, (err, downloadUrl) ->
  if error
    console.log "error", error
  else
    console.log 'file upload success, url: ', downloadUrl
    ...


```


### settings.json
```
{
  "public": {
    ...
  },
  "private": {
    "AWS": {
      "AWSAccessKeyId": "xxxxxxxxxxxxx",
      "AWSSecretAccessKey": "xxxxxxxxxxxxx",
      "region": "ap-northeast-2",
      "acl": "public-read",
      "imageUpload": {
        "bucket": "prj-diary.image",
        "cdn": "example.cloudfront.amazon.com"
      },
      "thumbnailUpload": {
        "bucket": "prj-diary.thumb",
        "cdn": "example2.cloudfront.amazon.com"
      }
      "fileUpload": {
        "bucket": "prj-diary.file",
        "cdn": "example2.cloudfront.amazon.com"
      }
    }
  }
}
```