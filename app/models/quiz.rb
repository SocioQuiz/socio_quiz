class Quiz < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  self.inheritance_column = :_type_disabled
end
