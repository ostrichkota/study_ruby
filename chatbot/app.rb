require 'sinatra'
require 'net/http'
require 'uri'
require 'json'
require 'line/bot'

# LINE Webhook は JSON POST で Referer が付かないため JsonCsrf のみ除外
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
  # V1 の Client 相当を parser + client に分割（署名は parser が担当）
  parser = Line::Bot::V2::WebhookParser.new(channel_secret: ENV['LINE_CHANNEL_SECRET'])
  client = Line::Bot::V2::MessagingApi::ApiClient.new(channel_access_token: ENV['LINE_CHANNEL_TOKEN'])

  events =
    begin
      parser.parse(body: body, signature: request.env['HTTP_X_LINE_SIGNATURE'])
    rescue Line::Bot::V2::WebhookParser::InvalidSignatureError
      halt 400, 'Bad Request'
    end

  events.each do |event|
    case event
    when Line::Bot::V2::Webhook::MessageEvent
      case event.message.type
      when 'text'
        message = { type: 'text', text: event.message.text }
        client.reply_message(
          reply_message_request: Line::Bot::V2::MessagingApi::ReplyMessageRequest.new(
            reply_token: event.reply_token,
            messages: [message]
          )
        )
      end
    end
  end

  'OK'
end