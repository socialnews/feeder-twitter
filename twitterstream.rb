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

# client = Twitter::Streaming::Client.new do |config|
#   config.consumer_key       = "OkDa508rn7hucG4gBEsZtWWWB"
#   config.consumer_secret    = "hvkhNWPoiJiXFcWrP0vELsvTvuDhT6Ywf8kwCGypUE3Exe7wwE"
#   config.access_token    = "3243672536-oTCVDsPktpKcRYq2FNRvOHF0MrsQ9SgLHioXs1w"
#   config.access_token_secret    = "ql9H6NoL62t9PpniZ7WQ82PibyGMZcPKL03KZ1AB0X7ws"
# end

topics = ["news"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
