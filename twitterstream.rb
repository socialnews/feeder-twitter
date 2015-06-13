require 'tweetstream'
require 'twitter'
require 'dotenv'
Dotenv.load

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key           = ENV["CONSUMER_KEY"]
  config.consumer_secret        = ENV["API_SECRET"]
  config.access_token           = ENV["ACCESS_TOKEN"]
  config.access_token_secret    = ENV["ACCESS_TOKEN_SECRET"]
end

topics = ["news"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
