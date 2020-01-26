# https://crystal-lang.org/api/0.32.1/OpenSSL.html
# https://crystal-lang.org/api/0.32.1/HTTP/Client.html
# https://crystal-lang.org/api/0.32.1/OpenSSL/SSL/Context/Client.html

require "openssl"
require "http/client"

response = HTTP::Client.get "https://github.com/btihen"
puts response.status_code      
response.body.each_line{ |line| puts line }

# instantiate a new ssl client (to customize and inject into our client)
ssl_client = OpenSSL::SSL::Context::Client.new
# the default 'PEER' mode - checks the cert's authority validity and expiration
puts ssl_client.verify_mode
# "NONE" tell's it not to do the above checks
ssl_client.verify_mode = OpenSSL::SSL::VerifyMode::NONE
puts ssl_client.verify_mode

# define a web client for a given server - with our customized ssl_client
# port is 443 by default for ssl
web_client = HTTP::Client.new(host: "localhost", port: 8443, tls: ssl_client)

# now we can override the url (with the path)
# HTTP::Client#get(path, headers : HTTP::Headers | ::Nil = nil, body : BodyType = nil)
response = web_client.get "/"
puts response.status_code      
response.body.each_line{ |line| puts line }

response = web_client.get "/bill"
puts response.status_code      
response.body.lines.each { |line| puts line }
