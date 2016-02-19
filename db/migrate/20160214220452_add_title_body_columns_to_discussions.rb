class AddTitleBodyColumnsToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :title, :string
    add_column :discussions, :body, :text
  end
end
