require 'omniauth/strategies/single_login'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  # TODO: Define external provider here
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :single_login, ENV['SLOGIN_KEY'], ENV['SLOGIN_SECRET']
end