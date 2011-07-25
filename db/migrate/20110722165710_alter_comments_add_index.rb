class AlterCommentsAddIndex < ActiveRecord::Migration
  def up
    add_index :comments, [:commentable_id, :commentable_type], :unique => true
  end

  def down
    remove_index :comments, [:commentable_id, :commentable_type]
  end
end
