class AddHtmlContentToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :html_content, :text
  end
end
