class AddThumbnailToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :thumbnail_file_name, :string
    add_column :issues, :thumbnail_content_type, :string
    add_column :issues, :thumbnail_file_size, :integer
    add_column :issues, :thumnail_updated_at, :datetime
  end
end
