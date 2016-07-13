window.cloudinary = {
  "api_key":"625568555693665",
  "cloud_name":"genco",
  "upload_preset": "dtxrfjqg"
}
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
      data.append("file", bytes);
      data.append('api_key', cloudinary.api_key);
      data.append('timestamp', Date.now() / 1000 | 0);
      jQuery.ajax({
        url: cloudinaryURL,
        data: data,
        cache: false,
        contentType: false,
        processData: false,
        headers: {},
        headers: {
          'Content-Type': undefined,
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json'
          // 'Access-Control-Request-Headers': 'accept, authorization, content-type',
          // 'Access-Control-Request-Method': 'POST'
        },
        // crossDomain: true,
        type: 'POST',
        // success: function(data){
        //   console.dir(data);
        //   resolve(data)
        // }
      }).then(resolve).fail(reject);
      // }).then(function(res){
        // console.dir(res)
      // }).fail(reject);
    })
  });
}
