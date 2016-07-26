$(document).on('click', '[data-modal]', function(e){
  if(e.metaKey) return; // open in new tab
  e.preventDefault();
  var $target = $(e.currentTarget);

  console.log("modal!")

  var $modal = $("#modalTemplate");
  // # console.log("hi")
  // # $('#myModal').on('show', function () {
  // #   $('iframe').attr("src",frameSrc);
  // # });
  // # $('#myModal').modal("show")
  // bookTitle
  var src = e.currentTarget.href || $target.closest('form').attr('action');
  console.dir(src)
  $modal.find("iframe").attr("src", src)

  $modal.find("#modalTitle").text($target.attr("data-title"))
  $modal.modal("show")
});
