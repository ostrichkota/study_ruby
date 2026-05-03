require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://localhost:4567/characters')
header = { 'Content-Type' => 'application/json' }
character = { 'name' => 'Naruto Uzumaki', 'Village' => 'Konohagakure' }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = character.to_json

response = http.request(request)
p response.body