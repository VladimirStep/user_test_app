Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  # TODO: Define external provider here
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end