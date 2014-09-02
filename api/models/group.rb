class Group < ActiveRecord::Base
  has_no_table

  column :nb, :integer
  column :course_id, :integer

  has_many :periods
  belongs_to :course
end
