class AddIdeasCallToActionToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :ideas_call_to_action, :text
  end
end
