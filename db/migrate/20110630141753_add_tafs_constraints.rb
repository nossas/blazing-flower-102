class AddTafsConstraints < ActiveRecord::Migration
  def up
    change_column :tafs, :petition_id, :integer, :null => false
    add_foreign_key :tafs, :petitions
    add_index :tafs, :petition_id, :unique => true
  end

  def down
    change_column :tafs, :petition_id, :integer, :null => true
    remove_foreign_key :tafs, :petitions
  end
end
