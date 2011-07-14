class AddIssueToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :issue_id, :integer
  end
end
