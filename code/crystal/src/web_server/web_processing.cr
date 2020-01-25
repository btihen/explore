require "http/server"
require "json"

server = HTTP::Server.new do |context|
  # get incoming info (for all details / headers, etc): 
  path_string   = context.request.path
  headers       = context.request.headers
  query_string  = context.request.query || ""
  params_tuples = context.request.query_params  
  params_string = params_tuples.map{|p| p.inspect}.join(", ")

  # log incomming requests
  puts "HTTP context is type: #{context.class.name}"
  puts "HTTP request path_string: #{path_string}"     # simple string of path
  puts "HTTP request query_string: #{query_string}"   # simple text of query
  puts "HTTP Params #{params_string} are of type: #{params_tuples.class.name}"
  puts "HTTP Headers #{headers.to_s} are of type: #{headers.class.name}"

  # process incomming requests
  if path_string.includes?(".")
    path, format  = path_string.split(".") 
  else
    path   = path_string
    format = ""
  end

  # build 'response'
  type, response = case format
                    when "text", "txt"
                      tmp_resp = "*Hello world*\n\tgot path: #{path_string}"
                      tmp_resp += "\n\tquery encoded is: #{query_string} and decoded is: #{URI.decode(query_string)}."  unless query_string == ""
                      ["text/plain; charset=UTF-8", tmp_resp]

                    when "json", "jsn"
                      path_list     = path.split("/")
                      params_hash   = params_tuples.each_with_object({} of String => String) { |pt,hash| hash[pt[0]] = pt[1] }
                      tmp_resp = {"path": path_string, 
                                  "query": "#{query_string} is actually #{URI.decode(query_string)}",
                                  "path_list": path_list,
                                  "params_hash": params_hash
                                }.to_json
                      ["application/json; charset=UTF-8", tmp_resp]
                      # # Alternative way to build the same Json - just for fun
                      # tmp_resp = JSON.build do |json|
                      #   json.object do
                      #     json.field "path", path_string
                      #     json.field "query", "#{query_string} is actually #{URI.decode(query_string || "")}"
                      #     json.field "path_list" do
                      #       json.array do
                      #         path_list.each { |p| json.string p }
                      #       end
                      #     end
                      #     json.field "query_list" do
                      #       json.object do
                      #         params_tuples.each do |param|
                      #           json.field param[0], param[1]
                      #         end
                      #       end
                      #     end
                      #   end
                      # end
                      # ["application/json; charset=UTF-8", tmp_resp]

                    else                      
                      tmp_resp = "<h1>Hello world</h1><b>got #{path_string}!</b>"
                      tmp_resp += " and #{query_string} is actually #{URI.decode(query_string)}."  unless query_string == ""
                      ["text/html; charset=UTF-8", tmp_resp]
                    end
  # configure response
  context.response.content_type = type
  # send response
  context.response.print response
  puts "sent request"
  puts
end

# start server as a listening fiber
puts "Listening on http://127.0.0.1:8080"
server.listen(8080)
