class AddPublishedToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :published, :boolean, :null => false, :default => false
  end
end
