require "http/client"

response = HTTP::Client.get "http://localhost:8080"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

response = HTTP::Client.get "http://localhost:8080/bill"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

response = HTTP::Client.get "http://localhost:8080/bill.json"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

response = HTTP::Client.get "http://localhost:8080/bill/tihen"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

response = HTTP::Client.get "http://localhost:8080/bill/tihen.json"
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima"}) # => dog=Nyima
response = HTTP::Client.get "http://localhost:8080/bill/tihen?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

# TODO: learn to encode webclient with utf-8
params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"})
response = HTTP::Client.get "http://localhost:8080/bill/tihen?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima"}) # => dog=Nyima
response = HTTP::Client.get "http://localhost:8080/bill/tihen.html?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"}) # => dog=Nyima&cat=Shiné
response = HTTP::Client.get "http://localhost:8080/bill/tihen.html?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima"}) # => dog=Nyima
response = HTTP::Client.get "http://localhost:8080/bill/tihen.json?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }

params = HTTP::Params.encode({"dog" => "Nyima", "cat" => "Shiné"}) # => dog=Nyima&cat=Shiné
response = HTTP::Client.get "http://localhost:8080/bill/tihen.json?" + params
puts response.status_code      
puts response.body.lines.each { |line| puts line }