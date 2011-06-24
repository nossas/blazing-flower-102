class AddActiveToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :active, :boolean, :default => true
  end
end
