class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.text :title
      t.text :link
      t.text :image_file_name
      t.text :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.text :type, :null => false

      t.timestamps
    end
  end
end
