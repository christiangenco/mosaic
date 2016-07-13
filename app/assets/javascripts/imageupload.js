var cloudinaryURL = "https://api.cloudinary.com/v1_1/" + cloudinary.cloud_name + "/image/upload";

window.imageupload = function(file, progress){
  return new Promise(function (resolve, reject){
    var data = new FormData();
    data.append('upload_preset', cloudinary.upload_preset);
    data.append("file", file);

    var request = new XMLHttpRequest();
    request.open('POST', cloudinaryURL, true);
    request.setRequestHeader("Accept", "application/json");
    request.setRequestHeader("Cache-Control", "no-cache");
    request.setRequestHeader("X-Requested-With", "XMLHttpRequest");

    request.onload = function(){
      if(request.readyState == 4 && request.status == 200){
        try{
          resolve(JSON.parse(request.responseText));
        }catch(e){
          reject(e);
        }
      }else{
        reject(request.statusText)
      }
    };

    request.onerror = reject;
    request.onprogress = progress;

    request.send(data);
  });
}
