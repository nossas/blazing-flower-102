class AddIdeasIdeaCategoriesFk < ActiveRecord::Migration
  def up
    execute "TRUNCATE ideas CASCADE"
    add_foreign_key(:ideas, :idea_categories)
  end

  def down
    remove_foreign_key(:ideas, :idea_categories)
  end
end
