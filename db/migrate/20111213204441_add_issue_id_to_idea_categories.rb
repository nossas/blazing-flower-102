class AddIssueIdToIdeaCategories < ActiveRecord::Migration
  def change
    add_column :idea_categories, :issue_id, :integer
    add_foreign_key(:idea_categories, :issues)
    execute "
    UPDATE idea_categories SET issue_id = COALESCE((SELECT MAX(id) FROM issues WHERE feature_ideas), (SELECT MAX(id) FROM issues));
    ALTER TABLE idea_categories ALTER issue_id SET NOT NULL;
    "
  end
end
