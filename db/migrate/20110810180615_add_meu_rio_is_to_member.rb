class AddMeuRioIsToMember < ActiveRecord::Migration
  def change
    add_column :members, :meu_rio_is, :text
  end
end
