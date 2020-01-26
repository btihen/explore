# to do all the http verbs see:
# https://crystal-lang.org/api/0.20.4/HTTP/Client.html
# NOTE: URI will encodes params to convert "Shiné" to "Shin%C3%A9"
require "http/client"

response = HTTP::Client.get "http://localhost:8080"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

# normally default is html
response = HTTP::Client.get "http://localhost:8080/bill/tihen"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

response = HTTP::Client.get "http://localhost:8080/bill/tihen.json"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

response = HTTP::Client.get "http://localhost:8080/bill/tihen.text"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

# send params: # => dog=Nyima&cat=Shiné
params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"})
response = HTTP::Client.get "http://localhost:8080/bill/tihen.txt?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"})
response = HTTP::Client.get "http://localhost:8080/bill/tihen.text?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"}) 
response = HTTP::Client.get "http://localhost:8080/bill/tihen.json?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"}) 
response = HTTP::Client.get "http://localhost:8080/bill/tihen.html?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }