class AddIdeasHeadlineToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :ideas_headline, :text
  end
end
