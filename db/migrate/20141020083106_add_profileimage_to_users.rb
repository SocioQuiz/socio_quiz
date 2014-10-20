class AddProfileimageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profileimage, :string
  end
end
