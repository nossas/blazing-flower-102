class LettersController < InheritedResources::Base
  before_filter :only => [:new] do 
    @issue = Issue.find(params[:issue_id])
    return redirect_to issue_path(@issue) unless @issue.letters_enabled?
  end

  def create
    create! do |success, failure|
      success.html do
        LetterMailer.new_letter(@letter).deliver
        redirect_to issue_letter_path(@letter.issue), :notice => "Valeu! Sua mensagem foi enviada!"
      end
    end
  end
end
