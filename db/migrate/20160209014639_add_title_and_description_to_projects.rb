class AddTitleAndDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :description, :text
  end
end
