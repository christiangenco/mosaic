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
    console.dir(e);
  })
})
