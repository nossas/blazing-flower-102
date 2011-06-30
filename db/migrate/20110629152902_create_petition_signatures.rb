class CreatePetitionSignatures < ActiveRecord::Migration
  def change
    create_table :petition_signatures do |t|
      t.integer :member_id
      t.integer :petition_id
      t.text :comment

      t.timestamps
    end
  end
end
