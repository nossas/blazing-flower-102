class LettersController < InheritedResources::Base
  before_filter :only => [:new] { @issue = Issue.find(params[:issue_id]) }

  def create
    create! do |success, failure|
      success.html do
        LetterMailer.new_letter(@letter).delay.deliver
        redirect_to issue_letter_path(@letter.issue), :notice => "Valeu! Sua mensagem foi enviada!"
      end
    end
  end
end
