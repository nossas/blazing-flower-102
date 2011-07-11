class RemoveNameFromMember < ActiveRecord::Migration
  def up
    remove_column :members, :name
  end

  def down
    add_column :members, :name, :text, :null => false
  end
end
