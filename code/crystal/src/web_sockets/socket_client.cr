# allow listen in background and accept new inputs too
require "http/web_socket"

# setup the websocket to connect to
uri    = URI.parse("ws://localhost:3030/chat")
socket = HTTP::WebSocket.new(uri)

puts uri

# code to processes messages when received from socket
socket.on_message do |message|
  puts message
end

# starts listening to the socket
# spawned so it backgrounds - then we can also enter messages
spawn socket.run

# get user name for identification
print "Name: "
name = gets

# send a notice you logged in
socket.send "Logged in: #{name}"

# loop until user quits with 'q'
loop do
  puts "enter a message or 'q' to end.\n> "
  # get user's inputted message
  mesg = gets
  # quit the program if 'q' is entered
  break if mesg == "q" || mesg == "Q"

  # send typed message to the socket for all to see
  socket.send "#{name}: #{mesg}"
end
