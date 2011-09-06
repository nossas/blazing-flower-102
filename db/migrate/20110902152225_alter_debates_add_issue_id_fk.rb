class AlterDebatesAddIssueIdFk < ActiveRecord::Migration
  def up
    add_foreign_key(:debates, :issues)
  end

  def down
    remove_foreign_key(:debates, :issues)
  end
end
