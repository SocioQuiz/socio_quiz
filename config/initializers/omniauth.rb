OmniAuth.config.on_failure do |env|
	[200, {}, [env['omniauth.error'].inspect]]
end
Rails.application.config.middleware.use OmniAuth::Builder do
	  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
		   :scope => 'email',
		   #:scope => 'fb_permissions', 
		   :provider_ignores_state => true, 
		   :display => 'page'
end
