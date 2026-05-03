require 'sinatra'
require 'net/http'
require 'uri'
require 'json'
require 'line/bot'

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

post '/callback' do
  body = request.body.read
  json = JSON.parse(body)
  client = Line::Bot::Client.new { |config|
    config.channel_id = ENV['LINE_CHANNEL_ID']
    config.channel_secret = ENV['LINE_CHANNEL_SECRET']
    config.channel_token = ENV['LINE_CHANNEL_TOKEN']
  }
  client.parse_events_from(json).each do |event|
    unless client.validate_signature(body, request.env['HTTP_X_LINE_SIGNATURE'])
      error 400 do 
        'Bad Request' 
      end
    end
  end
  events = client.parse_events_from(body)
  events.each do |event|
    case event
    when Line::Bot::Event::Message
      message = {
        type: 'text',
        text: event.message['text']
      }
      client.reply_message(event['replyToken'], message)
    end
    "ok"
  end
end