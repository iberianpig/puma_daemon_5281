//= require websocket_rails/main
var dispatcher = new WebSocketRails(`${window.location.host}/websocket`)
var channel = dispatcher.subscribe("message_to_everyone")
channel.bind('message.created', function(message) { 
  console.log(`a new message arrived!: ${message}`);
  alert(`a new message arrived!: ${message}`);
});
