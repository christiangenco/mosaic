# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_for post
    # puts "current user:"
    # p current_user
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify
  end
end

# NotificationsChannel.broadcast_to(user, {foo: 1})
