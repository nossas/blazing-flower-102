class AddFeaturedPersonalStoryToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :featured_personal_story_id, :integer
  end
end
