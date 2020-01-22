require "socket"
require "openssl"

# def client
#   socket = TCPSocket.new("127.0.0.1", 8443)
#   context = OpenSSL::SSL::Context::Client.new

#   ssl_socket = OpenSSL::SSL::Socket::Client.new(socket, context)
#   ssl_socket << "Testing"
# end

# require "http/client"

# response = HTTP::Client.get "https://localhost:8443"
# puts response.status_code      
# puts response.body.lines.each { |line| puts line }

# response = HTTP::Client.get "https://localhost:8443/bill"
# puts response.status_code      
# puts response.body.lines.each { |line| puts line }

# response = HTTP::Client.get "https://localhost:8443/bill/tihen"
# puts response.status_code      
# puts response.body.lines.each { |line| puts line }