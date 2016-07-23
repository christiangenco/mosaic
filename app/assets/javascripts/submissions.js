$(document).on('ajax:success', ".list-group-item form[data-remote=true]", function(e, data, status, xhr){
  $(e.currentTarget).closest(".list-group-item").replaceWith(data);
})
