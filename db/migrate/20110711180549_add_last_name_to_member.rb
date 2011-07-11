class AddLastNameToMember < ActiveRecord::Migration
  def change
    add_column :members, :last_name, :string, :null => false
  end
end
