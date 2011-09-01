class DefaultIsSubscriberToTrue < ActiveRecord::Migration
  def up
    change_column :members, :is_subscriber, :boolean, :default => true
  end

  def down
    change_column :members, :is_subscriber, :boolean
  end
end
