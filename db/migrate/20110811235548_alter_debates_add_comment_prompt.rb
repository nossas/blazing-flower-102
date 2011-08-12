# encoding: utf-8
class AlterDebatesAddCommentPrompt < ActiveRecord::Migration
  def up
    add_column :debates, :comment_prompt, :text, :null => false, :default => ''
  end

  def down
    remove_column :debates, :comment_prompt
  end
end
