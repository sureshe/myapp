class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
