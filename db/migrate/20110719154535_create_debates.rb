class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.text :question, :null => false
      t.text :quote_side_1
      t.text :quote_side_2
      t.text :text_side_1
      t.text :text_side_2
      t.integer :issue_id
      t.text :author_email_side_1, :null => false
      t.text :author_email_side_2, :null => false

      t.timestamps
    end
  end
end
