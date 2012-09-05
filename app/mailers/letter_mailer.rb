class LetterMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_letter letter
    @letter = letter
    mail(:to => ["governador@governador.rj.gov.br", "telmaoliveira@gabgovernador.rj.gov.br", "lurodrigues@gabgovernador.rj.gov.br"], :subject => @letter.subject, :from => @letter.email)
  end
end
