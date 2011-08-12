class IssuesController < ApplicationController
  
  def show
    @issue = Issue.where(:id => params[:id]).first
  end

  def archive
    @issues = Issue.has_articles
    @issue = Issue.where(:id => params[:id]).first

    @articles = (@issue.petitions.where(:state => 'published') + @issue.debates + @issue.personal_stories).sort{ |a, b| b.created_at <=> a.created_at }

    @article_count = @articles.length
    if !params[:page].nil? && params[:page].to_i > 1
      @page = params[:page].to_i
      @articles_start = (@page - 1) * 5
      article_end = @page * 5
      @articles = @articles[@articles_start..article_end]
      if @articles.length == 5
        @articles_end = @articles_start + 5
      else
        @articles_end = @articles_start + @articles.length
      end
    else 
      @page = 1
      @articles = @articles.first(5)
      @article_count == 0 ? @articles_start = 0 : @articles_start = 1
      @articles_end = @articles.length
    end

    if request.xhr?
      render :json => {:articles => @articles, :issue => @issue, :start => @articles_start, :end => @articles_end, :count => @article_count, :page => @page }
    end
  end

end
