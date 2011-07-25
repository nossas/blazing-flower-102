class CommentsController < InheritedResources::Base
  def create
    @comment = Comment.new(params[:comment])
    if debate_id = params[:debate][:id]
      debate = Debate.where(:id => debate_id).first
      @comment.commentable = debate
    end
    @comment.member = current_member

    if @comment.save
      flash[:notice] = "Comment successfully saved"
    else 
      flash[:notice] = "Comment could not be saved"
    end
    redirect_to debate_path(debate)
  end
end
