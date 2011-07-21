ActiveAdmin.register Comment, :as => "CommunityComment" do
  actions :all, :except => :new
  filter :commentable_type, :as => :select, :collection => Comment.select('DISTINCT(commentable_type)').all
  filter :created_at

  index do
    column :member do |c|
      c.member.email
    end
    column :content
    column :created_at
  end
end

