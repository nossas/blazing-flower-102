class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :sender
      t.string :email
      t.string :address
      t.string :city
      t.string :phone
      t.string :subject
      t.text :message
      t.integer :issue_id

      t.timestamps
    end
  end
end
