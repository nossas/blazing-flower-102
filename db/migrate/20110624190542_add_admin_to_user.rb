class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :is_admin, :boolean, :default => false
    add_column :admin_users, :is_campaigner, :boolean, :default => false
  end
end
