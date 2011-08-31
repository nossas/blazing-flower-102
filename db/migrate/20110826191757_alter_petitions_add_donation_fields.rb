class AlterPetitionsAddDonationFields < ActiveRecord::Migration
  def up
    add_column :petitions, :display_donation, :boolean, :null => false, :default => false
    add_column :petitions, :donation_thanks_message, :text
    add_column :petitions, :donation_headline, :text
    add_column :petitions, :donation_text, :text
  end

  def down
    remove_column :petitions, :display_donation
    remove_column :petitions, :donation_thanks_message
    remove_column :petitions, :donation_headline
    remove_column :petitions, :donation_text
  end
end
