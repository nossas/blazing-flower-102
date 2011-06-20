class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.text  :title, :null => false
      t.text  :path, :null => false
      t.text  :headline, :null => false
      t.text  :description
      t.text  :call_to_action, :null => false
      t.text  :short_description
      t.boolean :display_counter, :null => false, :default => true
      t.integer :counter_threshold, :null => false, :default => 0
      t.integer :counter_goal
      t.text  :current_state, :null => false, :default => 'draft'
      t.timestamps
    end
  end
end
