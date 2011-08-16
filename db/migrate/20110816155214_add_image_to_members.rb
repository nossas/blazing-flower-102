class AddImageToMembers < ActiveRecord::Migration
  def change
    add_column :members, :image_file_name,    :string
    add_column :members, :image_content_type, :string
    add_column :members, :image_file_size,    :integer
    add_column :members, :image_updated_at,   :datetime
  end
end
