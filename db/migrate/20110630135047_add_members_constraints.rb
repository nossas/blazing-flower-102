class AddMembersConstraints < ActiveRecord::Migration
  def up
    change_column :members, :email, :text, :null => false
    change_column :members, :name, :text, :null => false
    change_column :members, :zona, :text, :null => false
    add_index :members, :email, :unique => true
  end

  def down
    change_column :members, :email, :text, :null => true
    change_column :members, :name, :text, :null => true
    change_column :members, :zona, :text, :null => true
    remove_index :members, :email
  end
end
