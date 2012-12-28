class LetterMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_letter letter
    @letter = letter
    mail(:to => ["contato@meurio.org.br"], :subject => @letter.subject, :from => @letter.email)
  end
end
