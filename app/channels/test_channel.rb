class TestChannel < ApplicationCable::Channel

  def subscribed
    puts "TestChannel#subscribed"
    p params

    stream_from "test:#{params[:room]}"
  end

  def unsubscribed
    puts "TestChannel#unsubscribed"
    p params
  end

  def appear(data)
    puts "TestChannel#appear"
    p params
    p data
  end

  def away
    puts "TestChannel#away"
    p params
  end

  def receive(data)
    puts "TestChannel#receive"
    p data
  end
end

# TestChannel.broadcast_to(
#   "foo",
#   sent_by: 'Paul',
#   body: 'This is a cool chat app.'
# )

# WebNotificationsChannel.broadcast_to(
#   current_user,
#   title: 'New things!',
#   body: 'All the news fit to print'
# )

# post = Post.find(params[:id])
# stream_for post

# somewhere else:
# TestChannel.broadcast_to(@post, @comment)
