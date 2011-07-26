class DebatesController < InheritedResources::Base
  before_filter Proc.new { @comment = Comment.new if current_member }, :only => [:show]
  actions :show

  def load_comments
    @comments = Debate.where(:id => params[:id]).first.comments.page(params[:page]).per(10)
    if request.xhr?
      render :partial => 'comments/comments', :layout => false
    end
  end
end
