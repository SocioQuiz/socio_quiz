class AddUserIdToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :user_id, :integer
  end
end
