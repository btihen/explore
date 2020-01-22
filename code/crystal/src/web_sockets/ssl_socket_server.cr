# simplify and get working
require "socket"
require "http/web_socket"
require "http/server"

# print "Room: "
# room = gets

# setup socket tracking
@sockets  = [] of HTTP::WebSocket
@server_host : String
@server_port : Int32

# check the ENV Vars (or define them)
ENV["SERVER_ADDR"] ||= "localhost"
ENV["SERVER_PORT"] ||= "3030"

# define server variables
@server_addr = ENV["SERVER_ADDR"]
@server_port = ENV["SERVER_PORT"].to_i

ws_handler = HTTP::WebSocketHandler.new do |socket|
  puts "Socket opened"
  @sockets << socket

  # A very simple chat room indeed
  socket.on_message do |message|
    puts message
    @sockets.each { |socket| socket.send message }
  end

  # Clean up any references
  socket.on_close do
    @sockets.delete(socket)
  end

  # `.run` is called on the WebSocket automatically when this block returns
end

# Setup Server wo SSL - easy
server = HTTP::Server.new([ws_handler])
address = server.bind_tcp @server_host, @server_port
# address = server.bind_tcp "localhost", 3030
puts "Listening on ws://#{address}"
server.listen

# Setup Server with SSL
server = HTTP::Server.new([ws_handler]);
context = OpenSSL::SSL::Context::Server.new
context.certificate_chain = "./cert/server.cert"
context.private_key = "./cert/server.key"
address = server.bind_tls Socket::IPAddress.new(@server_host, @listen_port), context
puts "Listening via SSL on ws://#{address}"
server.listen


#############################

VTX_SERVER_ADDR="locahost"

module VTXClientServerCrystal
  VERSION = "0.1.0"
  class VTXClientServerCrystal
    @listen_port : Int32
    def initialize
      ENV["LISTEN_PORT"] ||= "7003"
      @listen_port = ENV["LISTEN_PORT"].to_i
    end
    def route_connections
      ws_handler = HTTP::WebSocketHandler.new {|client|
        client.on_message {|next_message|
          puts next_message
          client.send next_message
        };
      };
      server = HTTP::Server.new([ws_handler]);
      context = OpenSSL::SSL::Context::Server.new
      context.certificate_chain = "./cert/server.cert"
      context.private_key = "./cert/server.key"
      address = server.bind_tls Socket::IPAddress.new("127.0.0.1", @listen_port), context
      server.listen
    end
  end

  server = VTXClientServerCrystal.new
  server.route_connections
end
