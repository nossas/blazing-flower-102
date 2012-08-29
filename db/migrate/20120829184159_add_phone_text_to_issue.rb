class AddPhoneTextToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :phone_text, :text
  end
end
