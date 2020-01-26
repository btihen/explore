require "openssl"
require "http/client"

response = HTTP::Client.get "https://github.com/btihen"
puts response.status_code      
response.body.each_line{ |line| puts line } 