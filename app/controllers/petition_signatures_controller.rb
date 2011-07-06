class PetitionSignaturesController < ApplicationController
  def create
    #do we want to allow members to sign the same petition multiple times? 
    #right now we're assuming that we don't

    @member = Member.find_or_initialize_by_email(params[:member][:email])
    petition = Petition.where(:custom_path => params[:petition][:custom_path]).first

    if @member.new_record?
      @member.attributes = params[:member] 
      if not @member.save
        @errors = @member.errors.messages.map do |key, message|
          key.to_s.capitalize + ' ' + message.join(' ') 
        end.join('. ')
        return redirect_to custom_petition_path(petition.custom_path), :notice => @errors + '.'
      end
    end
    @signature = PetitionSignature.find_or_initialize_by_member_id_and_petition_id(@member.id, petition.id)
    if @signature.new_record?
      @signature.attributes = params[:petition_signature] 
      @signature.save
    else
      flash[:notice] = "You've already signed this petition."
    end
    redirect_to custom_taf_path(petition.custom_path)
  end
end
