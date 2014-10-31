class AddRepliesToPlays < ActiveRecord::Migration
  def change
    add_column :plays, :reply, :string
  end
end
