require "http/server"

# track the open websockets
SOCKETS = [] of HTTP::WebSocket

ws_handler = HTTP::WebSocketHandler.new do |socket|

  # log each new connection opened
  puts "Socket opened by client"
  puts socket.inspect

  # keep track of connections to send to
  SOCKETS << socket

  # listen for incoming messages on the socket
  socket.on_message do |message|
    # 'log' the messages on the server side
    puts message

    # send message to all connections
    SOCKETS.each { |socket| socket.send message }
  end

  # Clean up any references
  socket.on_close do
    SOCKETS.delete(socket)
  end

  # `.run` is called on the WebSocket automatically when this block returns
end

# define the server as the ws_handler block defined above
server = HTTP::Server.new([ws_handler])

# connect the websocket server to the TCP stack
address = server.bind_tcp "localhost", 3030

# Listen until '^c' is entered
puts "Listening on ws://#{address}"
server.listen
