require "http/server"
require "json"

server = HTTP::Server.new do |context|
  # get incomming info (for all details / headers, etc): 
  # https://crystal-lang.org/api/0.32.1/HTTP/Request.html
  path_string  = context.request.path
  query_string = context.request.query 

  # log incomming requests
  puts "HTTP request for path: #{path_string}"     # simple string of path
  puts "HTTP request for query: #{query_string}"   # simple text of query

  # process incomming requests
  if path_string.includes?(".")
    path, format  = path_string.split(".") 
  else
    path   = path_string
    format = ""
  end

  # choose 'response' based on format (in this case) - but could also route on path
  case format
  when "json", "jsn"

    path_list = path.split("/")
    puts path_list
    # https://crystal-lang.org/api/0.32.1/HTTP/Params.html
    params_tuples = context.request.query_params 
    puts params_tuples
  
    context.response.content_type = "application/json; charset=UTF-8"
    json_response = JSON.build do |json|
                      json.object do
                        json.field "path", path_string
                        json.field "query", query_string
                        json.field "path_list" do
                          json.array do
                            path_list.each { |p| json.string p }
                          end
                        end
                        json.field "query_list" do
                          json.object do
                            params_tuples.each do |param|
                              # key, value = param
                              # json.field key, value
                              json.field param[0], param[1]
                            end
                          end
                        end
                      end
                    end
    context.response.print json_response
  when "html", "htm"
    # build response
    html_response = "<h1>Hello world</h1><b>got #{path_string}!</b>"
    html_response += " and #{query_string} too."  unless query_string == ""
    # send response
    context.response.content_type = "text/html; charset=UTF-8"
    context.response.print html_response
  else
    # build response
    text_response = "Hello world, got #{path_string}!"
    text_response += " and #{query_string} too."  unless query_string == ""
    # send response
    context.response.content_type = "text/plain; charset=UTF-8"
    context.response.print text_response
  end
  puts "end request"
  puts
end

# start server as a listening fiber
puts "Listening on http://127.0.0.1:8080"
server.listen(8080)

