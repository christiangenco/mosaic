# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    puts "ChatChannel#subscribed"
    p params
    # this doesn't work:
    # stream_from "some_channel"
    stream_from "chat:some_channel"
  end

  def receive(data)
    print "ChatChannel#receive "
    p data
  end

  def unsubscribed
    puts "ChatChannel#unsubscribed"
    p params
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    puts "ChatChannel#speak"
    p params
  end
end

# ChatChannel.broadcast_to("some_channel", {foo: "bar"})
