class AddForgottenFieldsToDebate < ActiveRecord::Migration
  def change
    add_column :debates, :author_title_side_1, :text
    add_column :debates, :author_title_side_2, :text
    add_column :debates, :author_organization_side_1, :text
    add_column :debates, :author_organization_side_2, :text
    add_column :debates, :title, :text
  end
end
