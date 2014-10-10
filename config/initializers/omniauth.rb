Rails.application.config.middleware.use OmniAuth::Builder do
	  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
		   :scope => 'email,read_stream',
		   :display => 'popup'
end
