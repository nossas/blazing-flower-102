class AlterIndexCommentsOnCommentableIdAndCommentableType < ActiveRecord::Migration
  def up
    remove_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def down
    remove_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:commentable_id, :commentable_type], :unique => true
  end
end
