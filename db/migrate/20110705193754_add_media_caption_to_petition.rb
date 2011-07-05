class AddMediaCaptionToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :media_caption, :text
  end
end
