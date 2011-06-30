class PetitionsController < ApplicationController
  def show
    @petition = Petition.where(:custom_path => params[:custom_path]).first

    @petition_signature = PetitionSignature.new
    @member = Member.new
  end
end
