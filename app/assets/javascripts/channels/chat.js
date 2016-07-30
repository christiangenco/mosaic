App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.info("ChatChannel#connected");
    // Called when the subscription is ready for use on the server
    App.chat.send({ sent_by: "Paul", body: "This is a cool chat app." })
  },

  disconnected: function() {
    console.info("ChatChannel#disconnected");
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.info("ChatChannel#received");
    console.dir(data);
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function() {
    console.info("ChatChannel#speak");
    return this.perform('speak');
  }
});
