# allow listen in background and accept new inputs too

require "http/web_socket"

print "Name: "
name = gets
# print "Room: "
# room = gets

uri    = URI.parse("ws://localhost:3030")
socket = HTTP::WebSocket.new(uri)

socket.on_message do |message|
  puts message
end

# starts listening to the socket
spawn socket.run

# send a notice you logged in
socket.send "Logged in: #{name}"

# loop until user quits with 'q'
loop do
  puts "enter a message or 'q' to end.\n> "
  mesg = gets
  # quit the program if 'q' is entered
  break if mesg == "q" || mesg == "Q"

  socket.send "#{name}: #{mesg}"
end
