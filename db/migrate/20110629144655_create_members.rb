class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :zona
      t.string :email
      t.string :celular

      t.timestamps
    end
  end
end
