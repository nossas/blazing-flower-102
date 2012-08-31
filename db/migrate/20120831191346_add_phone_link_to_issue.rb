class AddPhoneLinkToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :phone_link, :string
  end
end
