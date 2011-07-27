class CreatePersonalStories < ActiveRecord::Migration
  def change
    create_table :personal_stories do |t|
      t.text :title
      t.string :description
      t.integer :issue_id
      t.string :connected_action
      t.text :video_embed_code

      t.timestamps
    end
  end
end
