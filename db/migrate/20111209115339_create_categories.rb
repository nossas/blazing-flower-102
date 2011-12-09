class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.text :name, :null => false
      t.text :badge, :null => false
      t.timestamps
    end

    add_index :categories, :name, :unique => true
  end

  def down
    drop_table :categories
  end
end
