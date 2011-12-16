require 'net/http'
require 'uri'

class Letter < ActiveRecord::Base
  belongs_to :issue

  after_create :send_letter

  def send_letter
    Net::HTTP.post_form(URI.parse('http://appl.globo.com/infoglobo/www/v6/carta_leitores/envia_email_carta.asp'), {
      :nome => self.sender, 
      :email => self.email, 
      :pais => "Brasil", 
      :endereco => self.address, 
      :cidade => self.city, 
      :estado => "RJ", 
      :telefone => self.phone, 
      :assunto => self.subject, 
      :txtTexto => self.message})
  end
end
