class AddValueToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :value, :string
  end
end
