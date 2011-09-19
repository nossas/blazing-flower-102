class MemberMailer < ActionMailer::Base
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.welcome.subject
  #
  def welcome member
    @member = member
    mail({
      :from => SITE['default_from_email_address'],
      :to => member.email,
      :subject => "Bem-vindo #{member.first_name}"
    }) do |format|
      format.text
      # format.html # Text only for now
    end

  end
end
