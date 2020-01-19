require "http/server"
require "json"

server = HTTP::Server.new do |context|
  route = context.request.path
  path  = route.split("/")
  puts route
  puts path
  
  case path[1]
  when "json"
    context.response.content_type = "application/json"
    json_response = JSON.build do |json|
                      json.object do
                        json.field "route", route
                        json.field "values" do
                          json.array do
                            # todo: dynamic array of path values
                            json.number 1
                            json.number 2
                          end
                        end
                      end
                    end
    context.response.print json_response
  when "html"
    context.response.content_type = "text/html; charset=UTF-8"
    context.response.print "<h1>Hello world</h1><b>got #{context.request.path}!</b>"   
  else
    context.response.content_type = "text/plain"
    context.response.print "*Hello world* -- got #{context.request.path}!"
  end
end

puts "Listening on http://127.0.0.1:8080"
server.listen(8080)

