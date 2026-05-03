require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://swapi.py4e.com/api/planets/')
response = Net::HTTP.get_response(uri)
planets = JSON.parse(response.body)

p planets['results'].map { |planet| planet['name'] }