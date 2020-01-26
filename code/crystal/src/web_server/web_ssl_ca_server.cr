# # # generatate a pem
# # https://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl
# # openssl req -x509 -newkey rsa:4096 -keyout ca_key.pem -out cert_auth.pem -days 365 -subj '/CN=localhost'

# # https://medium.com/@hugomejia74/how-to-create-your-own-ssl-certificate-authority-for-local-https-development-3b97573c7bb5
# # Make a CA - certificate authority
# # first generate a key
# # openssl genrsa -des3 -out ca_private.key 2048
# # # make a CA PEM (using the above key) - 'localhost_CA.pem' can be installed in clients (or the os of clients)
# # openssl req -x509 -new -nodes -key ca_private.key -sha256 -days 365 -out ca_auth.pem -subj '/CN=localhost'

# # or the above in one step with 4096 bits
# # https://stackoverflow.com/questions/10175812/how-to-create-a-self-signed-certificate-with-openssl
# openssl req -x509 -newkey rsa:4096 -keyout ca_private.key -out ca_auth.pem -days 365 -subj '/CN=localhost'

# # https://medium.com/@hugomejia74/how-to-create-your-own-ssl-certificate-authority-for-local-https-development-3b97573c7bb5
# # create a self-signed cert - using the above CA
# # start with making a key for the request
# openssl genrsa -out localhost.key 4096
# # make the certificate reqest 'csr' using the dev key
# openssl req -new -key localhost.key -out localhost_req.csr -subj '/CN=localhost'
# # Now generate the self-signed certificate based on the request & the CA
# openssl x509 -req -in localhost_req.csr -CA ca_auth.pem -CAkey ca_private.key -CAcreateserial -out localhost.crt -days 365 -sha256

# # # generate self-cert
# # https://www.akadia.com/services/ssh_test_certificate.html
# # # Step 1: Generate a Private Key
# # openssl genrsa -des3 -out server.key 1024
# # # Step 2: Generate a CSR
# # openssl req -new -key server.key -out server.csr
# # # Step 3: Remove Passphrase from Key
# # cp server.key server.key.org
# # openssl rsa -in server.key.org -out server.key
# # # Step 4: Generating a Self-Signed Certificate
# # openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt


# require "socket"
require "openssl"
require "http/server"

# def ssl_config
#   tls_config = OpenSSL::SSL::Context::Server.new
#   tls_config.private_key = "./server_private.key"
#   tls_config.certificate_chain = "./server_cert.crt"
#   tls_config
# end
tls_config = OpenSSL::SSL::Context::Server.new
tls_config.private_key = "./localhost.key"
tls_config.certificate_chain = "./localhost.crt"

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world, got #{context.request.path}!"
end
# ssl_config = generate_tls
# server.bind_tls "localhost", 8443, ssl_context # , settings.port_reuse
server.bind_tls "localhost", 8443, tls_config # , settings.port_reuse
puts "Listening on http://127.0.0.1:8443"
server.listen


# server = HTTP::Server.new do |context|
#   context.response.content_type = "text/plain"
#   context.response.print "Hello world, got #{context.request.path}!"
# end

# puts "Listening on http://127.0.0.1:8080"
# server.listen(8080)



# ssl_config = Amber::SSL.new(settings.ssl_key_file.not_nil!, settings.ssl_cert_file.not_nil!).generate_tls
# server.bind_tls Amber.settings.host, Amber.settings.port, ssl_config, settings.port_reuse



# https://crystal-lang.org/api/0.32.1/OpenSSL.html


# def server
#   # Bind new TCPSocket to port 5555
#   socket = TCPServer.new(5555)

#   context = OpenSSL::SSL::Context::Server.new
#   context.private_key = "./server.key"
#   context.certificate_chain = "./server.crt"

#   puts "Server is up"

#   socket.accept do |client|
#     puts "Got client"

#     bytes = Bytes.new(20)

#     ssl_socket = OpenSSL::SSL::Socket::Server.new(client, context)
#     ssl_socket.read(bytes)

#     puts String.new(bytes)
#   end
# end


# # https://github.com/amberframework/amber/blob/149f103ce264a21744c150e20dc677f3d850a33b/src/amber/server/ssl.cr
# require "openssl"

# module Amber
#   class SSL
#     def initialize(@key_file : String, @cert_file : String)
#     end

#     def generate_tls
#       tls = OpenSSL::SSL::Context::Server.new
#       tls.private_key = @key_file
#       tls.certificate_chain = @cert_file
#       tls
#     end
#   end
# end
# ssl_config = Amber::SSL.new(settings.ssl_key_file.not_nil!, settings.ssl_cert_file.not_nil!).generate_tls
# server.bind_tls Amber.settings.host, Amber.settings.port, ssl_config, settings.port_reuse


# # A very basic HTTP server
# require "http/server"

# server = HTTP::Server.new do |context|
#   context.response.content_type = "text/plain"
#   context.response.print "Hello world, got #{context.request.path}!"
# end

# # Setup Server with SSL
# # server = HTTP::Server.new([ws_handler]);
# address = server.bind_tls Socket::IPAddress.new(@server_host, @listen_port), context
# puts "Listening via SSL on ws://#{address}"
# server.listen


# puts "Listening on http://127.0.0.1:8080"
# server.listen(8080)

# # require "http/server"
# # require "json"

# # server = HTTP::Server.new do |context|
# #   route = context.request.path
# #   path  = route.split("/")
# #   puts route
# #   puts path

# #   case path[1]
# #   when "json"
# #     context.response.content_type = "application/json"
# #     json_response = JSON.build do |json|
# #                       json.object do
# #                         json.field "route", route
# #                         json.field "values" do
# #                           json.array do
# #                             # todo: dynamic array of path values
# #                             json.number 1
# #                             json.number 2
# #                           end
# #                         end
# #                       end
# #                     end
# #     context.response.print json_response
# #   when "html"
# #     context.response.content_type = "text/html; charset=UTF-8"
# #     context.response.print "<h1>Hello world</h1><b>got #{context.request.path}!</b>"
# #   else
# #     context.response.content_type = "text/plain"
# #     context.response.print "*Hello world* -- got #{context.request.path}!"
# #   end
# # end

# # puts "Listening on http://127.0.0.1:8080"
# # server.listen(8080)
