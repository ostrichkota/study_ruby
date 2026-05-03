require 'net/http'
require 'uri'

uri = URI.parse('https://narutodb.xyz/api/character')
response = Net::HTTP.get_response(uri)
p response.body