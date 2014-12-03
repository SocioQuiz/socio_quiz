class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @plays = Play.where(user_id: current_user.id)
    @totalScore = 0
    @plays.each do |play|
      @totalScore += play.score.to_i
    end
    respond_to do |format|
        format.html # show.html.erb
        format.json # show.json.jbuilder
    end
  end
end
