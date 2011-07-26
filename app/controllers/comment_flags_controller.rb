class CommentFlagsController < InheritedResources::Base
  actions :create, :destroy
  respond_to :json
  belongs_to :comment
  before_filter do
    params[:comment_flag] = {:member_id => current_member.id}
  end
end
