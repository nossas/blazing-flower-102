class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.text  :title,                 :null => false
      t.text  :custom_path
      t.text  :headline
      t.text  :description
      t.text  :call_to_action,        :default => 'Assine'
      t.text  :short_description
      t.boolean :display_counter,     :null => false, :default => true
      t.integer :counter_threshold,   :null => false, :default => 0
      t.integer :counter_goal
      t.boolean :display_comment_field, :null => false, :default => false
      t.text    :comment_question
      t.boolean :surface_comments,    :null => false, :default => false
      t.text  :state,                 :null => false, :default => 'draft'
      t.timestamps
    end

    add_index :petitions, :custom_path, :unique => true
  end
end
