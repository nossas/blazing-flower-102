class AddVocLinkToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :voc_link, :string
  end
end
