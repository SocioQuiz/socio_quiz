Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    current_user || warden.authenticate!(:scope => :user)
  end

  resource_owner_from_credentials do |routes|
    request.params[:user] = {:email => request.params[:username], :password => request.params[:password]}
    request.env['device.allow_params_authentication'] = true
    request.env['warden'].authenticate!(:scope => :user)
  end

  enable_application_owner :confirmation => false
end
