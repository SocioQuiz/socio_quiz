class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.boolean :correct
      t.integer :score

      t.timestamps
    end
  end
end
