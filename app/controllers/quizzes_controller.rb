class QuizzesController < ApplicationController
  # skip_before_filter :authenticate_user
  before_action :set_quiz, only: [:show, :edit, :update, :destroy, :play]
  before_action :set_category
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
    # Auto adjust the quiz's point(quiz's score) when the user leave it blank.
    if params[:quiz][:point].to_s.length != 0
    else
       params[:quiz][:point] = "0"
    end

    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      # Strong parameters are question and answer. User should be input these two params.
      if params[:quiz][:question].to_s.length != 0 && params[:quiz][:answer].to_s.length != 0
        if @quiz.save
          format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
          format.json { render :show, status: :created, location: @quiz }
        else
          format.html { render :new }
          format.json { render json: @quiz.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @quiz, alert: 'Your operation was not completed. Check your answer or question again.'}
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
    #printf("play respond:\r\n @quiz.id:%s\r\n @quiz.user_id:%s\r\n current_user.id:%s\r\n", @quiz.id, @quiz.user_id, current_user.id)
      if @quiz.answer == params[:play][:reply]
        @play = Play.new user_id: current_user.id, quiz_id: params[:play][:quiz_id],
                         reply: params[:play][:reply], correct: true, score: @quiz.point
        if @quiz.user_id != current_user.id || current_user.permission == "admin"
          @play.save
          redirect_to quizzes_url, notice: 'correct'
        else
          redirect_to quizzes_url, notice: 'You don\'t have permission for playing the quiz.'
        end
      else
        @play = Play.new user_id: current_user.id, quiz_id: params[:play][:quiz_id],
                         reply: params[:play][:reply], correct: false, score: 0
        if @quiz.user_id != current_user.id || current_user.permission == "admin"
          @play.save
          redirect_to quizzes_url, notice: 'incorrect'
        else
          redirect_to quizzes_url, alert: 'You don\'t have permission for playing the quiz.'
        end
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    if @quiz.user_id == current_user.id || current_user.permission == "admin"
      # Auto adjust the quiz's point(quiz's score) when the user leave it blank.
      if params[:quiz][:point].to_s.length != 0
      else
         params[:quiz][:point] = "0"
      end

      respond_to do |format|
        # Strong parameters are question and answer. User should be input these two params.
        if params[:quiz][:question].to_s.length != 0 && params[:quiz][:answer].to_s.length != 0
          if @quiz.update(quiz_params)
            format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
            format.json { render :show, status: :ok, location: @quiz }
          else
            format.html { render :edit }
            format.json { render json: @quiz.errors, status: :unprocessable_entity }
          end
        else
            format.html { render :edit }
            format.json { render json: @quiz.errors, status: :unprocessable_entity }

        end
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    # Assign quiz destroy's permission to admin and created quiz of user's owner 
    if @quiz.user_id == current_user.id || current_user.permission == "admin"
      @quiz.destroy
      respond_to do |format|
        format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html {redirect_to quizzes_url, alert: 'You don\'t have quiz\'s delete permission.'}
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def set_category
      @category = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      
      params.require(:quiz).permit(:question, :answer, :user_id, :category_id, :type, :selection_1, :selection_2, :selection_3, :selection_4, :selection_5, :selection_6, :selection_7, :selection_8, :selection_9, :point)
    end
end
