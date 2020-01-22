require "socket"
require "http/web_socket"
require "http/server"

# setup socket tracking
routes   = ["dogs", "cats"]
sockets  = [] of HTTP::WebSocket
# sockets  = {} of String => HTTP::WebSocket
server_host : String
server_port : Int32

# check the ENV Vars (or define them)
ENV["SERVER_ADDR"] ||= "localhost"
ENV["SERVER_PORT"] ||= "3030"

# define server variables
server_addr = ENV["SERVER_ADDR"]
server_port = ENV["SERVER_PORT"].to_i

ws_handler = HTTP::WebSocketHandler.new do |socket|
  puts "Socket opened: #{socket.request}"
  sockets << socket

  # A very simple chat room indeed
  socket.on_message do |message|
    puts message
    sockets.each { |socket| socket.send message }
  end

  # Clean up any references
  socket.on_close do
    sockets.delete(socket)
  end

  # `.run` is called on the WebSocket automatically when this block returns
end

# https://crystal-lang.org/api/0.19.4/HTTP/Request.html
# https://crystal-lang.org/api/0.19.4/HTTP/WebSocketHandler.html
server = HTTP::Server.new([ws_handler])
address = server.bind_tcp server_addr, server_port
puts "Listening on ws://#{address}"
server.listen
