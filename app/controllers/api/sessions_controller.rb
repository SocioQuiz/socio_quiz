#Session controller provides a token
module Api
  class SessionsController < Devise::SessionsController
    before_filter :authenticate_user!, :except => [:create]
    before_filter :ensure_params_exist, :except => [:destroy]
    respond_to :json

    def create
      resource = User.find_for_database_authentication(:email => params[:user_login][:email])
      return invalid_login_attempt unless resource

      if resource.valid_password?(params[:user_login][:password])
        sign_in(:user, resource)
        resource.ensure_authentication_token!
        render :json=> {:auth_token=>resource.authentication_token, :email=>resource.email}, :status => :ok
        return
      end
      invalid_login_attempt
    end

    def destroy
      resource = User.find_by_authentication_token(params[:auth_token]||request.headers["X-AUTH-TOKEN"])
      resource.authentication_token = nil
      resource.save
      sign_out(resource_name)
      render :json => {}.to_json, :status => :ok
    end

    protected
    def ensure_params_exist
      return unless params[:user_login].blank?
      render :json=>{:message=>"missing user_login parameter"}, :status=>422
    end

    def invalid_login_attempt
      render :json=> {:message=>"Error with your login or password"}, :status=>401
    end
  end
end
