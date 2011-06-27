class CreateTafs < ActiveRecord::Migration
  def change
    create_table :tafs do |t|
      t.text :thank_you_headline, :default => 'Obrigado por participar'
      t.text :thank_you_text
      t.boolean :display_orkut, :null => false, :default => false
      t.text :orkut_title
      t.text :orkut_link
      t.text :orkut_message
      t.boolean :display_facebook, :null => false, :default => false
      t.text :facebook_title
      t.text :facebook_link
      t.text :facebook_message
      t.boolean :display_twitter, :null => false, :default => false
      t.text :tweet
      t.text :twitter_url
      t.boolean :display_email, :null => false, :default => false
      t.text :email_subject
      t.text :email_message
      t.boolean :display_copy_url, :null => false, :default => false
      t.integer :petition_id

      t.timestamps
    end
  end
end
