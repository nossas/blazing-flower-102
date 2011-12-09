class CreateConfigurations < ActiveRecord::Migration
  def up
    create_table :configurations do |t|
      t.text :name, :null => false
      t.text :value
      t.timestamps
    end
  end

  def down
    drop_table :configurations
  end
end
