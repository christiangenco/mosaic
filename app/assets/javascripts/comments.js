// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ajax:success', ".new_comment", function(e, data, status, xhr){
  $(e.target).closest(".ajaxReplace").replaceWith(data);
});
