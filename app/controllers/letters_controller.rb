class LettersController < InheritedResources::Base
  before_filter :only => [:new] { @issue = Issue.find(params[:issue_id]) }

  def create
    create! do |success, failure|
      success.html { redirect_to issue_letter_path(@letter.issue), :notice => "Valeu! Sua carta foi enviada ao jornal O Globo!" }
    end
  end
end
