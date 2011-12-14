class CreateIdeaHelpMethods < ActiveRecord::Migration
  def up
    create_table :idea_help_methods do |t|
      t.text :name, :null => false
      t.integer :issue_id, :null => false
      t.timestamps
    end
    add_foreign_key :idea_help_methods, :issues
    add_index :idea_help_methods, [:issue_id, :name], :unique => true
  end

  def down
    drop_table :idea_help_methods
  end
end
