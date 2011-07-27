class DebatesController < InheritedResources::Base
  before_filter Proc.new { @comment = Comment.new if current_member }, :only => [:show]
  actions :show

  def show
    @debate = Debate.where(:id => params[:id]).first
    @comments = @debate.comments.visible.order("created_at ASC")
  end

  def load_comments
    @comments = Debate.where(:id => params[:id]).first.comments.visible.page(params[:page]).per(5)
    if request.xhr?
      render :partial => 'comments/comments', :layout => false
    end
  end
end
