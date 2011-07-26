ActiveAdmin.register Comment, :as => "CommunityComment" do
  menu :label => 'Comments'
  actions :all, :except => :new
  filter :commentable_type, :as => :select, :collection => ActiveRecord::Base.connection.execute('SELECT DISTINCT(commentable_type) as commentable_type FROM comments').map{|c| c["commentable_type"] }
  filter :created_at

  scope :awaiting_moderation, :default => true
  scope :moderated

  member_action :accept_comment do
    Comment.find(params[:id]).accept
    return redirect_to(:back)
  end

  member_action :reject_comment do
    Comment.find(params[:id]).reject
    return redirect_to(:back)
  end

  index do
    column :member do |c|
      c.member.email
    end
    column :content
    column :created_at
    column :comment_accepted, :sortable => :comment_accepted do |ps|
      if ps.comment_accepted
        span b 'Yes'
      else
        span link_to('Yes', accept_comment_admin_community_comment_path(ps))
      end
      if ps.comment_accepted.nil? or ps.comment_accepted
        span link_to('No', reject_comment_admin_community_comment_path(ps))
      else
        span b 'No'
      end
    end
  end
end

