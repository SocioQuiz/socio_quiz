class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @plays = Play.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @plays }
    end
  end
end
