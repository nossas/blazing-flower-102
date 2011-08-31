ActiveAdmin.register PetitionSignature, :as => 'PetitionComment' do
  menu :parent => 'Petitions', :label => "Comment", :priority => 0

  actions :all, :except => :new
  filter :petition
  filter :created_at

  scope :unmoderated, :default => true
  scope :moderated

  member_action :accept_comment do
    PetitionSignature.find(params[:id]).accept_comment
    return redirect_to(:back)
  end
  member_action :reject_comment do
    PetitionSignature.find(params[:id]).reject_comment
    return redirect_to(:back)
  end

  collection_action :already_moderated do
    span b 't'
  end
  
  index do
    column :comment, :sortable => false
    column :created_at
    column :comment_accepted, :sortable => :comment_accepted do |ps|
      if ps.comment_accepted
        span b 'Yes'
      else
        span link_to('Yes', accept_comment_admin_petition_comment_path(ps))
      end
      if ps.comment_accepted.nil? or ps.comment_accepted
        span link_to('No', reject_comment_admin_petition_comment_path(ps))
      else
        span b 'No'
      end
    end
  end
  
end
