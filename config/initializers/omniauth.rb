Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['ADD_YOUR_FACEBOOK_APP_KEY'], ENV['ADD_YOUR_FACEBOOK_APP_SECRET']
end
