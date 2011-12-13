class AddFeatureIdeasToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :feature_ideas, :boolean, :null => false, :default => false
  end
end
