var cloudinaryURL = "https://api.cloudinary.com/v1_1/" + cloudinary.cloud_name + "/image/upload";

function getFileBytes(file){
  return new Promise(function(fulfill, reject){
    reader = new FileReader()
    reader.onload = function(event) {
      var arrayBuffer = reader.result
      var bytes = new Uint8Array(arrayBuffer);
      fulfill(bytes);
    };
    reader.readAsArrayBuffer(file);
  });
}

window.imageupload = function(file){
  return new Promise(function (resolve, reject){
    getFileBytes(file).then(function(bytes){
      var data = new FormData();
      data.append('upload_preset', cloudinary.upload_preset);
      data.append('api_key', cloudinary.api_key);
      data.append('timestamp', Date.now() / 1000 | 0);
      data.append("file", file);

      var request = new XMLHttpRequest();
      request.open('POST', cloudinaryURL, true);
      // request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
      request.setRequestHeader("Accept", "application/json");
      request.setRequestHeader("Cache-Control", "no-cache");
      request.setRequestHeader("X-Requested-With", "XMLHttpRequest");
      request.send(data);

      request.onload = function() {
        console.dir(request);
        console.info(request.status)
        if (request.status >= 200 && request.status < 400) {
          // Success!
          var resp = request.responseText;
        } else {
          // We reached our target server, but it returned an error

        }
      };
    })
  });
}
