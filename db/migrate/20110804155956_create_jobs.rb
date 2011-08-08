class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :title, :null => false
      t.text :description, :null => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
