class AddTwAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tw_access_token, :string
  end
end
