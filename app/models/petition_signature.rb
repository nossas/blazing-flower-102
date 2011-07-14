class PetitionSignature < ActiveRecord::Base
  belongs_to :petition
  belongs_to :member

  after_create :send_confirmation

  def send_confirmation
    PetitionMailer.petition_signature_confirmation(self).deliver
  end

end
