##OmniAuth.config.on_failure do |env|
##	[200, {}, [env['omniauth.error'].inspect]]
##	[200, {}, [env['omniauth.auth'].inspect]]
	#if request.param['origin']
#		[200, {}, [env['omniauth.origin'].inspect]]
	#end
##end
##Rails.application.config.middleware.use OmniAuth::Builder do
##	  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
##		   :scope => 'email',
		   #:scope => 'fb_permissions',
##		   :provider_ignores_state => true,
##		   :response_type => 'token',
##		   :display => 'page'
##end
