class AddThumbnailVideoUrlToPersonalStory < ActiveRecord::Migration
  def change
    add_column :personal_stories, :thumbnail, :text
    add_column :personal_stories, :video_url, :text
  end
end
