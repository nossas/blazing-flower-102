class AddAutofireEmailsConstraints < ActiveRecord::Migration
  def up
    add_foreign_key :autofire_emails, :petitions
    add_index :autofire_emails, :petition_id
  end

  def down
    remove_foreign_key :autofire_emails, :petitions
    remove_index :autofire_emails, :petition_id
  end
end
