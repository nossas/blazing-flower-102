class AddIdeasMediaToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :ideas_media, :text
  end
end
