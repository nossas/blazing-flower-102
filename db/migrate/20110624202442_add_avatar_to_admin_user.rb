class AddAvatarToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :avatar_file_name, :string
    add_column :admin_users, :avatar_content_type, :string
    add_column :admin_users, :avatar_file_size, :integer
    add_column :admin_users, :avatar_updated_at, :datetime
  end
end
