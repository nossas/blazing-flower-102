class CreateIdeaMerges < ActiveRecord::Migration
  def change
    create_table :idea_merges do |t|
      t.integer :idea_id, :null => false
      t.integer :from_id, :null => false
      t.boolean :requested, :null => false, :default => false
      t.boolean :pending, :null => false, :default => false
      t.boolean :finished, :null => false, :default => false
      t.timestamps
    end
    add_foreign_key :idea_merges, :ideas
    add_foreign_key :idea_merges, :ideas, {:column => :from_id}
  end
end
