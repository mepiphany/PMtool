class AddReferencesToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :project, index: true, foreign_key: true
    add_column :tasks, :status, :boolean, default: false
  end
end
