class AddMoreAlternateImagesToTaf < ActiveRecord::Migration
  def change
    add_column :tafs, :alternate_facebook_image_2_file_name, :string
    add_column :tafs, :alternate_facebook_image_2_content_type, :string
    add_column :tafs, :alternate_facebook_image_2_file_size, :integer
    add_column :tafs, :alternate_facebook_image_2_updated_at, :datetime

    add_column :tafs, :alternate_facebook_image_3_file_name, :string
    add_column :tafs, :alternate_facebook_image_3_content_type, :string
    add_column :tafs, :alternate_facebook_image_3_file_size, :integer
    add_column :tafs, :alternate_facebook_image_3_updated_at, :datetime

    add_column :tafs, :alternate_facebook_image_4_file_name, :string
    add_column :tafs, :alternate_facebook_image_4_content_type, :string
    add_column :tafs, :alternate_facebook_image_4_file_size, :integer
    add_column :tafs, :alternate_facebook_image_4_updated_at, :datetime
  end
end
