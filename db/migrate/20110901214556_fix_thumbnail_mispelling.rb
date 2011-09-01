class FixThumbnailMispelling < ActiveRecord::Migration
  def up
    remove_column :issues, :thumnail_updated_at
    add_column :issues, :thumbnail_updated_at, :datetime
  end

  def down
    remove_column :issues, :thumbnail_updated_at
    add_column :issues, :thumnail_updated_at, :datetime
  end
end
