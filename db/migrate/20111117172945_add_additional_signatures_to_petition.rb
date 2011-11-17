class AddAdditionalSignaturesToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :additional_signatures, :integer, :null => false, :default => 0
  end
end
