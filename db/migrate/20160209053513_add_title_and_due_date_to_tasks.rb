class AddTitleAndDueDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :due_date, :date
  end
end
