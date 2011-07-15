ActiveAdmin.register PetitionSignature do
  menu :label => "Moderate Petition Comments"
  filter :petition
  filter :created_at

  controller do
    def accept_comment
      PetitionSignature.find(params[:id]).accept_comment
      return redirect_to admin_petition_signatures_path
    end
    def reject_comment
      PetitionSignature.find(params[:id]).reject_comment
      return redirect_to admin_petition_signatures_path
    end
  end
  index do
    column :comment, :sortable => false
    column :created_at
    column :comment_accepted, :sortable => :comment_accepted do |ps|
      if ps.comment_accepted
        span b 'Yes'
      else
        span link_to('Yes', admin_accept_comment_path(ps.id))
      end
      if ps.comment_accepted.nil? or ps.comment_accepted
        span link_to('No', admin_reject_comment_path(ps.id))
      else
        span b 'No'
      end
    end
  end
  
end
