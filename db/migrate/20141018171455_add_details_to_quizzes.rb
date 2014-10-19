class AddDetailsToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :type, :string
    add_column :quizzes, :selection_1, :string
    add_column :quizzes, :selection_2, :string
    add_column :quizzes, :selection_3, :string
    add_column :quizzes, :selection_4, :string
    add_column :quizzes, :selection_5, :string
    add_column :quizzes, :selection_6, :string
    add_column :quizzes, :selection_7, :string
    add_column :quizzes, :selection_8, :string
    add_column :quizzes, :selection_9, :string
    add_column :quizzes, :point, :integer
  end
end
