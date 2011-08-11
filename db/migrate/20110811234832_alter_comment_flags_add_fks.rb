class AlterCommentFlagsAddFks < ActiveRecord::Migration
  def up
    execute "DELETE FROM comment_flags WHERE comment_id NOT IN (SELECT id FROM comments)"
    add_foreign_key(:comment_flags, :comments)
    add_foreign_key(:comment_flags, :members)
  end

  def down
    remove_foreign_key(:comment_flags, :comments)
    remove_foreign_key(:comment_flags, :members)
  end
end
