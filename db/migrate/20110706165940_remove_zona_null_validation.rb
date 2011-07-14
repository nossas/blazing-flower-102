class RemoveZonaNullValidation < ActiveRecord::Migration
  def up
    change_column :members, :zona, :text, :null => true
  end

  def down
    change_column :members, :zona, :text, :null => false
  end
end
