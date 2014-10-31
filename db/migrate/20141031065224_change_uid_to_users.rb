class ChangeUidToUsers < ActiveRecord::Migration
  def change
    change_column :users, :uid, :string, :limit => nil
  end
end
