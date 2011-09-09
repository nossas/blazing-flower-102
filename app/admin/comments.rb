# coding: utf-8
ActiveAdmin.register Comment, :as => "CommunityComment" do
  menu :label => 'Comentários', :parent => 'Debates', :priority => 0

  actions :all, :except => :new
  filter :commentable_type, :as => :select, :collection => ["debates"]
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
    column :debate do |c|
      span link_to(c.commentable.title, issue_debate_path(c.commentable.issue_id, c.commentable), :target => '_blank') if c.commentable
    end
    column :member do |c|
      c.member.email
    end
    column :content
    column :created_at do |m|
      l m.created_at, :format => :short
    end
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

