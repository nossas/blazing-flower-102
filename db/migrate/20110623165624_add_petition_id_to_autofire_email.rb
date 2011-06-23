class AddPetitionIdToAutofireEmail < ActiveRecord::Migration
  def change
    add_column :autofire_emails, :petition_id, :integer
  end
end
