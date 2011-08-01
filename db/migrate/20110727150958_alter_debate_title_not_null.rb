class AlterDebateTitleNotNull < ActiveRecord::Migration
  def up
    execute "TRUNCATE debates CASCADE;"
    change_column :debates, :title, :text, :null => false
  end

  def down
    change_column :debates, :title, :text, :null => true
  end
end
