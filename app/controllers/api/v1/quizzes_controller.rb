module Api
  module V1
    class QuizzesController < ApplicationController
      before_action :doorkeeper_authorize!
      before_action :set_quiz, only: [:answer]

      respond_to    :json
      def index
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
  end
end
