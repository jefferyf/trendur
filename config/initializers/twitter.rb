require "rubygems"
require "twitter"
# Certain methods require authentication. To get your Twitter OAuth credentials,
# register an app at http://dev.twitter.com/apps
Twitter.configure do |config|
  config.consumer_key = "odEYTSssAHWK54wEgXAeJQ"
  config.consumer_secret = "QKx5PF9zRkC5KZOV3W4pwi2Xtw03HHrlgGs2tqk1TI"
  config.oauth_token = "255354733-pbc3iq9KGYPu3F4QQuoS6INd5Qici09v0Vc1xpjr"
  config.oauth_token_secret = "9HnyYjV06NSejhpdRcagKX4hYkgVHjYoxAoudS2Jg"
end