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

    // don't show notifications in modal views
    if(window.qs && window.qs.hideLayout) return;

    window.toastr[data.type || "info"](data.body || "", data.title || "Notification", {
      onclick: function() {
        if(data.path){
          window.Turbolinks.visit(data.path)
        }
      }
    })
  },

  notify: function() {
    return this.perform('notify');
  }
});

window.toastr.options = {
  progressBar: true,
  hideMethod: "slideUp",
  closeButton: true,
  timeOut: 0,
  extendedTimeOut: 10000,
  hideDuration: 300,
}
