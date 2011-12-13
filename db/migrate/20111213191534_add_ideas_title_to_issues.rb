class AddIdeasTitleToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :ideas_title, :text
  end
end
