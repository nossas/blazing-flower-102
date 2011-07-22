class DebatesController < InheritedResources::Base
  before_filter Proc.new { @comment = Comment.new if current_member }, :only => [:show]
  actions :show
end
