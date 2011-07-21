class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :member_id, :null => false
      t.integer :commentable_id, :null => false
      t.string :commentable_type, :null => false
      t.text :content, :null => false
      t.boolean :comment_accepted

      t.timestamps
    end
  end
end
