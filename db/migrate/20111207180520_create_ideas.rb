class CreateIdeas < ActiveRecord::Migration
  def up
    create_table :ideas do |t|
      t.integer :member_id, :null => false
      t.integer :issue_id, :null => false
      t.integer :category_id, :null => false
      t.integer :parent_id
      t.text    :title, :null => false
      t.text :headline
      t.boolean :featured, :null => false, :default => false
      t.boolean :recommended, :null => false, :default => false
      t.integer :likes, :null => false, :default => 0
      t.integer :order
      t.timestamps
    end
    add_foreign_key(:ideas, :members)
    add_foreign_key(:ideas, :issues)
    add_foreign_key(:ideas, :ideas, {:column => :parent_id})
    add_index :ideas, :issue_id
  end

  def down
    drop_table :ideas
  end
end
