var remoteFormSelector = "form[data-remote=true]";

$(document).on('ajax:beforeSend', remoteFormSelector, function(e, xhr, settings){
  // console.log("beforeSend")
  $(e.target).find("button").prop("disabled", true)
}).on('ajax:success', remoteFormSelector, function(e, data, status, xhr){
  // console.log("ajax:success")
  $(e.target).find("button").addClass("btn-success");
}).on('ajax:error', remoteFormSelector, function(e, xhr, status, error){
  // console.log("ajax:error")
  $(e.target).find("button").addClass("btn-warning");
}).on('ajax:complete', remoteFormSelector, function(e, xhr, status){
  // console.log("ajax:complete")
  $(e.target).find("button").prop("disabled", false)
})
