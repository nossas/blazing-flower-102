class AddFirstNameToMember < ActiveRecord::Migration
  def change
    add_column :members, :first_name, :string, :null => false
  end
end
