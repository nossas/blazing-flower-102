class PersonalStoriesController < ApplicationController
  def issue_index
    @issue = Issue.where(:id => params[:issue_id]).first
    @stories = @issue.personal_stories
    @current = @stories.where(:id => params[:id]).first || @stories.first

    render 404 unless !@stories.blank?

    @debate = @issue.debates.first
    @petition = @issue.petitions.first
  end

  def show
    @story = PersonalStory.where(:id => params[:id]).first

    if request.xhr?
      render :json => @story
    end
  end

end
