App.testChannel = App.cable.subscriptions.create({
  channel: "TestChannel",
  room: "foo",
  foo: "bar",
}, {
  connected: function(){
    console.info("testChannel:connected");
  },
  received: function(data){
    console.info("testChannel:received: ");
    console.dir(data);
  },
  disconnected: function(){
    console.info("testChannel:disconnected: ");
  }
})

// App.testChannel.send({
//   sent_by: "Paul",
//   body: "This is my chat app"
// })
