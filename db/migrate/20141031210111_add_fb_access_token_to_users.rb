class AddFbAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_access_token, :string
  end
end
