class AddGgAccessTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gg_access_token, :string
  end
end
