class CommentsController < InheritedResources::Base
  actions :index
  optional_belongs_to :debate
  respond_to :html, :only => [ :create, :index ]
  respond_to :json, :only => [ :create ]

  def index
    index! do |format|
      format.html{ render :partial => 'comments', :layout => false }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    if debate_id = params[:debate][:id]
      debate = Debate.where(:id => debate_id).first
      @comment.commentable = debate
    end
    @comment.member = current_member

    if @comment.save
      if request.xhr?
        render :partial => "comments/comment", :layout => false, :locals => { :comment => @comment }
      else
        flash[:notice] = "Comment successfully saved"
        redirect_to debate_path(debate)
      end
    else 
      if request.xhr?
        render :json => @comment.errors, :status => :unprocessable_entity
      else
        flash[:notice] = "Comment could not be saved"
        redirect_to debate_path(debate)
      end
    end
  end
end
