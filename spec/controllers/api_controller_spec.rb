require 'rails_helper'

RSpec.describe ApiController, :type => :controller do

  describe "GET quizzes" do
    it "returns http success" do
      get :quizzes
      expect(response).to be_success
    end
  end

  describe "GET answer" do
    it "returns http success" do
      get :answer
      expect(response).to be_success
    end
  end

end
