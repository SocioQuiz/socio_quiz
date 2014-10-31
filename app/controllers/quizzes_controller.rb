class QuizzesController < ApplicationController
  # skip_before_filter :authenticate_user
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :play]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end

  end

  def play
    @play = Play.new quiz_id: params[:id]
  end

  def respond
    @quiz = Quiz.find(params[:play][:quiz_id])
    if user_signed_in?
      if @quiz.answer == params[:play][:reply]
        @play = Play.new user_id: current_user.id, quiz_id: params[:play][:quiz_id],
                         reply: params[:play][:reply], correct: true, score: @quiz.point
        @play.save
        redirect_to quizzes_url, notice: 'correct'
      else
        @play = Play.new user_id: current_user.id, quiz_id: params[:play][:quiz_id],
                         reply: params[:play][:reply], correct: false, score: 0
        @play.save
        redirect_to quizzes_url, notice: 'incorrect'
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:question, :answer, :user_id, :type, :selection_1, :selection_2, :selection_3, :selection_4, :selection_5, :selection_6, :selection_7, :selection_8, :selection_9, :point)
    end
end
