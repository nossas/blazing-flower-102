class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :name
      t.text :excerpt
      t.text :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
