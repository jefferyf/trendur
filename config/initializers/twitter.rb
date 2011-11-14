require "rubygems"
require "twitter"
# Certain methods require authentication. To get your Twitter OAuth credentials,
# register an app at http://dev.twitter.com/apps
Twitter.configure do |config|
  config.consumer_key = "1NY1uF8vxN7QQDIskNfoGw"
  config.consumer_secret = "df5NZJ3eyr9QcBHV4V1zeJEu6uQEfRPvF5RGxKyjv8Y"
  config.oauth_token = "255354733-4MCUQJszrmTCT6pumHin9H8W17tOaKPhbyO5CrpH"
  config.oauth_token_secret = "9oW18ZcrCCxV6dEEgtGafCWTsHhl2wJ20uPcIbdOVU"
end