class AlterPersonalStoriesAddIssueIdFk < ActiveRecord::Migration
  def up
    add_foreign_key(:personal_stories, :issues)
  end

  def down
    remove_foreign_key(:personal_stories, :issues)
  end
end
