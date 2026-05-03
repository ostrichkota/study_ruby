require 'sinatra'
require 'net/http'
require 'uri'
require 'json'

# set :host_authorization, { permitted_hosts: [] }

get '/' do
  'Hello World'
end

get '/ok' do
  'OK'
end

get '/hi' do
  'Hi'
end

get '/characters' do
  uri = URI.parse('https://narutodb.xyz/api/character')
  response = Net::HTTP.get_response(uri)
  characters = JSON.parse(response.body)
  characters.to_json
end

post '/characters' do
  data = JSON.parse(request.body.read)
  "Received character: #{data['name']}"
end

get '/planets' do
  content_type 'application/json'
  uri = URI.parse('https://swapi.py4e.com/api/planets/')
  response = Net::HTTP.get_response(uri)
  planets = JSON.parse(response.body)
  planets['results'].map { |planet| planet['name'] }.to_json
end