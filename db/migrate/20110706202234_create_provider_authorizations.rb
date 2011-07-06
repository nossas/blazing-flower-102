class CreateProviderAuthorizations < ActiveRecord::Migration
  def change
    create_table :provider_authorizations do |t|
      t.integer :member_id, :null => false
      t.text :provider, :null => false
      t.text :uid, :null => false
      t.text :token
      t.timestamps
    end
    add_index :provider_authorizations, [:member_id, :provider], :unique => true
    add_index :provider_authorizations, [:provider, :uid], :unique => true
    add_foreign_key :provider_authorizations, :members
  end
end
