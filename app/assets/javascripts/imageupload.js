var cloudinaryURL = "https://api.cloudinary.com/v1_1/" + cloudinary.cloud_name + "/image/upload";

window.imageupload = function(file){
  return new Promise(function (resolve, reject){
    var data = new FormData();
    data.append('upload_preset', cloudinary.upload_preset);
    // data.append('api_key', cloudinary.api_key);
    // data.append('timestamp', Date.now() / 1000 | 0);
    data.append("file", file);

    var request = new XMLHttpRequest();
    request.open('POST', cloudinaryURL, true);
    // request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    request.setRequestHeader("Accept", "application/json");
    request.setRequestHeader("Cache-Control", "no-cache");
    request.setRequestHeader("X-Requested-With", "XMLHttpRequest");

    request.onload = function(){
      console.dir(request);
      console.info(request.status)
      if (request.status >= 200 && request.status < 400) {
        // Success!
        var resp = request.responseText;
      } else {
        // We reached our target server, but it returned an error

      }
    };

    request.onerror = function() {
      // There was a connection error of some sort
    };

    // request.onProgress = function(){}

    request.send(data);
  });
}
