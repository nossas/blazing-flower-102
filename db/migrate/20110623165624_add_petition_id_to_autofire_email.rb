class AddPetitionIdToAutofireEmail < ActiveRecord::Migration
  def change
    add_column :autofire_emails, :petition_id, :integer, :null => false
    add_foreign_key(:autofire_emails, :petitions)
  end
end
