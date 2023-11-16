# https://github.com/websocket-rails/websocket-rails/wiki/WebsocketRails-Controllers
class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def new_message
    controller_store[:message_count] += 1

    message = event.data
    WebsocketRails[:message_to_everyone].trigger 'new', message
  end

  # var dispatcher = new WebSocketRails(`${window.location.host}/websocket`)
  # var channel = dispatcher.subscribe("message_to_everyone")
  # channel.bind('new', function(message) { console.log(`a new message arrived!: ${message}`); });
  #
  # dispatcher.trigger('chat.message', 'hello world!');
end
