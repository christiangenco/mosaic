App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.info("notifications:connected");
  },

  disconnected: function() {
    console.info("notifications:disconnected");
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.info("notifications:received");
    console.dir(data);
    console.log(data.title)
    window.toastr["info"](data.message || "", data.title || "Notification", {onclick: () => {
      if(data.path){
        window.Turbolinks.visit(data.path)
      }
    }})
  },

  notify: function() {
    return this.perform('notify');
  }
});

toastr.options = {
  progressBar: true,
  hideMethod: "slideUp",
}
