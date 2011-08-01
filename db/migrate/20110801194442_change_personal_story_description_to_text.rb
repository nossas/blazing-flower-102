class ChangePersonalStoryDescriptionToText < ActiveRecord::Migration
  def up
    change_column :personal_stories, :description, :text
  end

  def down
    change_column :personal_stories, :description, :string
  end
end
