class DebatesController < InheritedResources::Base
  before_filter Proc.new { @comment = Comment.new if current_member }, :only => [:show]
  actions :show

  def show
    @debate = Debate.where(:id => params[:id]).first
    return render_404 unless @debate

    @distinct_member_count = @debate.distinct_member_count
    @comments = @debate.comments.visible
    if params[:todos]
      @initial_comments = @comments.all
    else
      @initial_comments = @comments.first(5)
    end
  end

  def load_comments
    @comments = Debate.where(:id => params[:id]).first.comments.visible.page(params[:page]).per(5)
    if request.xhr?
      render :partial => 'comments/comments', :layout => false
    end
  end
end
