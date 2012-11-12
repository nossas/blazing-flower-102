class LetterMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_letter letter
    @letter = letter
    mail(:to => ["claudiacostin@rioeduca.net", "almiroliveira@rioeduca.net", "mariza.lomba@rioeduca.net"], :subject => @letter.subject, :from => @letter.email)
  end
end
