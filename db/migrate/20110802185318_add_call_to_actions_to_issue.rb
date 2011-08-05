class AddCallToActionsToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :debate_call_to_action, :text
    add_column :issues, :petition_call_to_action, :text
    add_column :issues, :personal_story_call_to_action, :text
  end
end
