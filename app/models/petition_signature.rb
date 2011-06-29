class PetitionSignature < ActiveRecord::Base
  belongs_to :petition
  belongs_to :member

end
