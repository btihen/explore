# A very basic HTTP server
# https://crystal-lang.org/api/0.19.4/HTTP/Server.html
# https://crystal-lang.org/api/0.19.4/HTTP/Handler.html
require "http/server"

server = HTTP::Server.new do |context|

  # get incomming info: 
  # https://crystal-lang.org/api/0.32.1/HTTP/Request.html
  path   = context.request.path
  query  = context.request.query
  params = context.request.query_params

  # log request info (stdout - screen)
  # https://crystal-lang.org/api/0.32.1/HTTP/Request.html
  puts "HTTP request for path: #{path}"
  puts "HTTP request for query: #{query}"
  
  # could also grab header info: 
  # https://crystal-lang.org/api/0.32.1/HTTP/Headers.html

  # build text response
  text_response = "Hello world, got #{path}!"
  text_response += " and #{query}"  unless query == ""

  # send response to the web client
  context.response.content_type = "text/plain"
  context.response.print text_response
end

puts "Listening on http://127.0.0.1:8080"
server.listen(8080)

