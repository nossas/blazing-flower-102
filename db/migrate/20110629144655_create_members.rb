class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :name
      t.text :zona
      t.text :email
      t.text :celular

      t.timestamps
    end
  end
end
