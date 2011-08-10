class AddExcerptToPersonalStory < ActiveRecord::Migration
  def change
    add_column :personal_stories, :excerpt, :text
  end
end
