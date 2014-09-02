class Course < ActiveRecord::Base
  has_no_table

  column :name, :string
  column :bachelor_id, :integer

  has_many :groups
end