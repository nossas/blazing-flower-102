class PetitionSignaturesController < ApplicationController
  def create
    #do we want to allow members to sign the same petition multiple times? 
    #right now we're assuming that we don't

    @member = Member.find_or_initialize_by_email(params[:member][:email])
    petition = Petition.where(:custom_path => params[:petition][:custom_path]).first

    if @member.new_record?
      @member.attributes = params[:member] 
      if @member.save
        PetitionSignature.create({:member_id => @member.id, :petition_id => petition.id})
        redirect_to custom_taf_path(petition.custom_path)
      else 
        render :action => 'petition/show'
      end
    else
      @signature = PetitionSignature.find_or_initialize_by_member_id_and_petition_id(@member.id, petition.id)
      if @signature.new_record?
        @signature.save
        redirect_to custom_taf_path(petition.custom_path)
      else
        redirect_to custom_taf_path(petition.custom_path), :notice => "You've already signed this petition."
      end
    end
  end
end
