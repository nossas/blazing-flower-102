class AddMediaToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :media, :text
    add_column :petitions, :call_to_action_headline, :text
    add_column :petitions, :call_to_action_text, :text
  end
end
