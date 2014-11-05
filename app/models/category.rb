class Category < ActiveRecord::Base
  has_many :quizzes
end
