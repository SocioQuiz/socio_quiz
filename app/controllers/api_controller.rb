class ApiController < ApplicationController
  before_action :set_quiz, only: [:answer]
  def quizzes
    @quizzes = Quiz.all
  end

  def answer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end
end
