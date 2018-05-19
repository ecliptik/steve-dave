#!/usr/bin/env ruby
# encoding: utf-8

require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'cgi'

#Gifs to choose from
statuses = ["Tell 'Em Steve-Dave!",
          "You know what ol' Jack Burton always says at a time like this?",
          "Sooner or later I rub everybody the wrong way.",
          "I think I'm a sofa...",
          "faster than Walt Flanagan's dog...",
          "That kid is back on the escalator again!",
          "Wow! It's a schooner!"
]

# Set slack status using legacy api
# https://api.slack.com/docs/presence-and-status
def set_status(message, emoji)
  # Read personal slack token from environment
  slack_token = ENV["SLACK_PERSONAL_TOKEN"]
  status_json = "{\"status_text\": \"#{message}\", \"status_emoji\": \"#{emoji}\"}"
  encoded = CGI.escape(status_json)
  data = "token=#{slack_token}&profile=#{encoded}"
  uri = URI.parse("https://slack.com/api/users.profile.set")
  https = Net::HTTP.new(uri.host,uri.port)
  https.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.body = data
  res = https.request(req)
end

# Function to randomly choose when to update next between 4 and 24 hours
def randomSleep()
  prng = Random.new
  return prng.rand(240..1440)
end

begin
  puts '[' + Time.now.strftime('%b %d %T.%2N') + '] Starting up...'

  while true
    day = Time.now.strftime("%A")
    puts "Current day is #{day}"

    # Set staus for specific day or fallback to random status
    case day
    when "Thursday"
      status = "It must be Thursday. I never could get the hang of Thursdays."
    when "Friday"
      status = "It's Friday"
    else
      status = statuses.sample
    end

    #Update slack status
    puts "Setting status: #{status}"
    #Optional emoji
    emoji = ":docker:"
    set_status(status, emoji)

    #Sleep for random minutes to update again
    sleepTime = randomSleep
    puts "Sleeping for #{sleepTime} minutes..."
    sleep(sleepTime)
  end
end
