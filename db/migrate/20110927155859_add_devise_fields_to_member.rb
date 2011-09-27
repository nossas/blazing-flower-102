class AddDeviseFieldsToMember < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.confirmable
      t.recoverable
      t.boolean :has_non_oauth_login
      t.string :password, :limit => 128
      t.string :encrypted_password, :null => false, :default => '', :limit => 128
    end
  end

  def self.down
    change_table :members do |t|
      t.remove :password
      t.remove :encrypted_password
      t.remove :has_non_oauth_login
      t.remove :confirmation_token
      t.remove :confirmed_at
      t.remove :confirmation_sent_at
      t.remove :reset_password_sent_at
      t.remove :reset_password_token
    end
  end
end
