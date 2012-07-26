class AddVocTextToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :voc_text, :text
  end
end
