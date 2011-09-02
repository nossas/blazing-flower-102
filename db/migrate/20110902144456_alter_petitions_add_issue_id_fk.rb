class AlterPetitionsAddIssueIdFk < ActiveRecord::Migration
  def up
    add_foreign_key(:petitions, :issues)
  end

  def down
    remove_foreign_key(:petitions, :issues)
  end
end
