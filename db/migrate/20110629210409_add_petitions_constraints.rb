class AddPetitionsConstraints < ActiveRecord::Migration
  def change
    change_column :petitions, :custom_path, :text, :null => false
    change_column :petitions, :call_to_action, :text, :null => false
    change_column :petitions, :call_to_action_headline, :text, :null => false
    change_column :petitions, :call_to_action_text, :text, :null => false
    change_column :petitions, :media, :text, :null => false
  end
end
