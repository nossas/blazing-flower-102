class AddPetitionSignaturesConstraints < ActiveRecord::Migration
  def up
    change_column :petition_signatures, :petition_id, :integer, :null => false
    change_column :petition_signatures, :member_id, :integer, :null => false
    add_index :petition_signatures, [:petition_id, :member_id], :unique => true
    add_index :petition_signatures, :member_id
    add_foreign_key(:petition_signatures, :petitions)
    add_foreign_key(:petition_signatures, :members)
  end

  def down
    change_column :petition_signatures, :petition_id, :integer, :null => true
    change_column :petition_signatures, :member_id, :integer, :null => true
    remove_index :petition_signatures, [:petition_id, :member_id]
    remove_index :petition_signatures, :member_id
    remove_foreign_key(:petition_signatures, :petitions)
    remove_foreign_key(:petition_signatures, :members)
  end
end
