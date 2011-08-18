class AddIsSubscriberToMembers < ActiveRecord::Migration
  def change
    add_column :members, :is_subscriber, :boolean
  end
end
