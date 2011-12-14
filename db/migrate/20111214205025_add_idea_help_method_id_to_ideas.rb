class AddIdeaHelpMethodIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :idea_help_method_id, :integer
    add_foreign_key :ideas, :idea_help_methods
  end
end
