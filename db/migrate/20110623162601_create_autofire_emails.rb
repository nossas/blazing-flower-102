class CreateAutofireEmails < ActiveRecord::Migration
  def change
    create_table :autofire_emails do |t|
      t.text :from,    :null => false, :default => SITE['default_from_email_address']
      t.text :subject, :null => false, :default => 'Obrigado por participar'
      t.text :message

      t.timestamps
    end
  end
end
