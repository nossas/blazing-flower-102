class RenameCategoriesToIdeaCategories < ActiveRecord::Migration
  def up
    execute "DROP TABLE IF EXISTS ideas"
    execute "ALTER TABLE ideas RENAME category_id TO idea_category_id"
    create_table :idea_categories do |t|
      t.text :name, :null => false
      t.text :badge, :null => false
      t.timestamps
    end

    add_index :idea_categories, :name, :unique => true
  end

  def down
    drop_table :idea_categories
    execute "ALTER TABLE ideas RENAME idea_category_id TO category_id"
    create_table :categories do |t|
      t.text :name, :null => false
      t.text :badge, :null => false
      t.timestamps
    end

    add_index :categories, :name, :unique => true
  end
end
