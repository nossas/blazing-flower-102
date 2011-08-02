class AddFeaturedDebateFeaturedPetitionToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :featured_petition_id, :integer
    add_column :issues, :featured_debate_id, :integer
  end
end
