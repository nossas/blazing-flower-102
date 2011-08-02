class IssuesController < ApplicationController
  
  def show
    @issue = Issue.where(:id => params[:id]).first
  end

end
