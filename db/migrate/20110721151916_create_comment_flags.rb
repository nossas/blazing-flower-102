class CreateCommentFlags < ActiveRecord::Migration
  def change
    create_table :comment_flags do |t|
      t.integer :member_id, :null => false
      t.integer :comment_id, :null => false

      t.timestamps
    end
  end
end
