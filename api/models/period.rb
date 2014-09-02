class Period < ActiveRecord::Base
  has_no_table
  self.inheritance_column = nil

  column :type, :string
  column :weekday_index, :integer
  column :start_time, :integer
  column :end_time, :integer
  column :group_id, :integer

  belongs_to :group
end
