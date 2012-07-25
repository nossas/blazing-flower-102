class AddPdpLinkToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :pdp_link, :string
  end
end
