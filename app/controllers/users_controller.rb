class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @plays = Play.where(user_id: current_user.id)
    @totalscore = 0
    correctcount = 0
    @plays.each do |play|
      @totalscore += play.score.to_i
      correctcount += 1 if play.correct == true
    end
    @accuraterate = correctcount.to_f / @plays.count
    respond_to do |format|
      format.html # show.html.erb
      format.json # show.json.jbuilder
    end
  end
end
