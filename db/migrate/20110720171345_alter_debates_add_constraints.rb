class AlterDebatesAddConstraints < ActiveRecord::Migration
  def up
    add_foreign_key(:debates, :members, {:column => :author_email_side_1, :primary_key => :email})
    add_foreign_key(:debates, :members, {:column => :author_email_side_2, :primary_key => :email})
    add_index(:debates, :author_email_side_1)
    add_index(:debates, :author_email_side_2)
  end

  def down
    remove_foreign_key(:debates, {:column => :author_email_side_1, :primary_key => :email})
    remove_foreign_key(:debates, {:column => :author_email_side_2, :primary_key => :email})
    remove_index(:debates, :author_email_side_1)
    remove_index(:debates, :author_email_side_2)
  end
end
