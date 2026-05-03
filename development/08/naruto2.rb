require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://narutodb.xyz/api/character')
response = Net::HTTP.get_response(uri)
p response.body

characters = JSON.parse(response.body)
p characters