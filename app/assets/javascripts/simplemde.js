document.addEventListener("turbolinks:load", function() {
  $("textarea[markdown]").each(function(i, e){
    var simplemde = new SimpleMDE({
      element: e,
      autofocus: false,
      autosave: {
        enabled: false,
        delay: 10000,
        uniqueId: ""
      },
      // force syncing to original textarea
      forceSync: false,
      hideIcons: false,
      indentWithTabs: false,
      lineWrapping: true,
      promptURLs: false,
      codeSyntaxHighlighting: true,
      // shortcuts: [],
      showIcons: true,
      spellChecker: true,
      // status: [],
      tabSize: 2,
      // toolbar: [],
     });
    // console.dir(e);

    simplemde.codemirror.on("drop", function(cm, e){
      // e.preventDefault();  // stop default behaviour
      console.dir(e);
      // console.dir(e.dataTransfer.files[0])
      imageupload(e.dataTransfer.files[0]).then(function(imageData){
        console.info("Success:")
        console.dir(imageData)
      }).catch(function(error){
        console.info("There was an error returned:", error.responseText)
        // console.dir(error)
      });
      // return false;
    });

    // console.dir(simplemde)
  });
});
