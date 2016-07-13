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
      if(e.dataTransfer.files.length == 0) return true;
      e.preventDefault();

      window.cm = cm;
      console.dir(cm);
      console.dir(cm.display.cursorDiv.childElementCount)
      // cm.replaceRange("hi", {line: 1, ch: 0})
      // cm.replaceRange("hi", cm.getCursor())
      // console.dir(cm.getCursor())
      // return;

      var progress = function(e){
        console.dir(e);
        if (e.lengthComputable){
          var percent = (e.loaded / e.total)*100;
          console.dir(percent);
        }
      }
      imageupload(e.dataTransfer.files[0], progress).then(function(image){
        console.info("Success:");
        console.dir(image);
        var imageCode = "![" + image.original_filename + "](" + image.secure_url + ")"
        cm.replaceRange(imageCode, cm.getCursor())
      }).catch(function(error){
        console.info("There was an error returned:")
        console.dir(error)
      });
      // return false;
    });

    // console.dir(simplemde)
  });
});
