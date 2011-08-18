class AlterIssuesAddFks < ActiveRecord::Migration
  def up
    execute "
    DELETE FROM issues WHERE featured_petition_id NOT IN (SELECT id FROM petitions);
    DELETE FROM issues WHERE featured_debate_id NOT IN (SELECT id FROM debates);
    DELETE FROM issues WHERE featured_personal_story_id NOT IN (SELECT id FROM personal_stories);
    "
    add_foreign_key :issues, :petitions, :column => :featured_petition_id
    add_foreign_key :issues, :debates, :column => :featured_debate_id
    add_foreign_key :issues, :personal_stories, :column => :featured_personal_story_id
  end

  def down
    execute "ALTER TABLE issues DROP CONSTRAINT issues_featured_debate_id_fk"
    execute "ALTER TABLE issues DROP CONSTRAINT issues_featured_personal_story_id_fk"
    execute "ALTER TABLE issues DROP CONSTRAINT issues_featured_petition_id_fk"
  end
end
