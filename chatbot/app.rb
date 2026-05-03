require 'sinatra'
require 'net/http'
require 'uri'
require 'json'
require 'line/bot'

# LINE の Webhook は JSON POST で Referer が付かないため、JsonCsrf だけ外す
configure do
  set :protection, except: [:json_csrf]
end

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

  client = Line::Bot::Client.new { |config|
    config.channel_id = ENV['LINE_CHANNEL_ID']
    config.channel_secret = ENV['LINE_CHANNEL_SECRET']
    config.channel_token = ENV['LINE_CHANNEL_TOKEN']
  }

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  halt 400, 'Bad Request' unless client.validate_signature(body, signature)

  events = client.parse_events_from(body)
  events.each do |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text
        message = {
          type: 'text',
          text: event.message['text']
        }
        client.reply_message(event.reply_token, message)
      end
    end
  end

  'OK'
end