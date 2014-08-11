class Task < ActiveRecord::Base
  belongs_to :project

  validates :task_name, :presence => true
  validates :task_description, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
end
