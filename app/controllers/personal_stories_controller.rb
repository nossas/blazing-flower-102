class PersonalStoriesController < ApplicationController
  def issue_index
    @issue = Issue.where(:id => params[:issue_id]).first
    @stories = @issue.personal_stories 

    @debate = @issue.debates.first
    @petition = @issue.petitions.first
  end
end
