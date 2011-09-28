class AddHasLoginFlagToMember < ActiveRecord::Migration
  def change
    add_column :members, :has_login, :boolean
  end
end
