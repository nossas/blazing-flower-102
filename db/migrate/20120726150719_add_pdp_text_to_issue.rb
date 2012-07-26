class AddPdpTextToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :pdp_text, :text
  end
end
