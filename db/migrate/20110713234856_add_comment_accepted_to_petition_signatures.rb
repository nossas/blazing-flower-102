class AddCommentAcceptedToPetitionSignatures < ActiveRecord::Migration
  def change
    add_column :petition_signatures, :comment_accepted, :boolean
  end
end
