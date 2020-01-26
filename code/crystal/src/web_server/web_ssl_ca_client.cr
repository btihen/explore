require "openssl"
require "http/client"

tls_client = OpenSSL::SSL::Context::Client.new
tls_client.ca_certificates = "./ca_auth.pem"
puts tls_client.verify_mode  # verify "PEER"

# now we can override the url (with the path to visit on the server)
web_client = HTTP::Client.new(host: "localhost", port: 8443, tls: tls_client)

response = web_client.get "/"
puts response.status_code      
response.body.each_line{ |line| puts line }

response = web_client.get "/bill"
puts response.status_code      
response.body.lines.each { |line| puts line }