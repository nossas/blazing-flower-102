class AddLettersEnabledToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :letters_enabled, :boolean
  end
end
