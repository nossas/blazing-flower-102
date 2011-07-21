class AlterCommentFlagsAddIndex < ActiveRecord::Migration
  def up
    add_index :comment_flags, [:comment_id, :member_id], :unique => true
  end

  def down
    remove_index :comment_flags, [:comment_id, :member_id]
  end
end
