@dataURItoBlob = (dataURI) ->

# separate out the mime component
  mimeString = dataURI.split(",")[0].split(":")[1].split(";")[0]
  binary = atob(dataURI.split(",")[1])
  array = []
  i = 0

  while i < binary.length
    array.push binary.charCodeAt(i)
    i++
  new Blob([ new Uint8Array(array) ],
    type: mimeString
  )

@imageUploader = new Slingshot.Upload("imageUpload")
@thumbnailUploader = new Slingshot.Upload("thumbnailUpload")
@fileUploader = new Slingshot.Upload("fileUpload")
