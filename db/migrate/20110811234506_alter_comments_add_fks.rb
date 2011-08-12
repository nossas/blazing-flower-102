class AlterCommentsAddFks < ActiveRecord::Migration
  def up
    execute "DELETE FROM comment_flags WHERE comment_id IN (SELECT id FROM comments WHERE member_id NOT IN (SELECT id FROM members))"
    execute "DELETE FROM comments WHERE member_id NOT IN (SELECT id FROM members)"
    add_foreign_key(:comments, :members)
  end

  def down
    remove_foreign_key(:comments, :members)
  end
end
