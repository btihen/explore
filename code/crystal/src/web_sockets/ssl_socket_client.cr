# get working

require "http/web_socket"

# HTTP::WebSocket.new("websocket.example.com", "/chat")            # Creates a new WebSocket to `websocket.example.com`
# HTTP::WebSocket.new("websocket.example.com", "/chat", tls: true) # Creates a new WebSocket with TLS to `ẁebsocket.example.com`

uri    = URI.parse("ws://localhost:3000")
socket = HTTP::WebSocket.new(uri)  
socket.send "Howdy1"

socket.on_message do |message|
  puts message
end

socket.send "Howdy2"

socket.run

socket.send "Howdy2"