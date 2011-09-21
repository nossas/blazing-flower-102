class PetitionSignaturesController < ApplicationController
  def index
    @petition_signature = PetitionSignature.joins(:member).where(['members.email = ? AND petition_signatures.petition_id = ?', params[:email], params[:petition_id]]).first
    respond_to do |format|
      format.json { render :json => @petition_signature.to_json }
    end
  end

  def create
    #do we want to allow members to sign the same petition multiple times? 
    #right now we're assuming that we don't

    @member = current_member || Member.find_or_initialize_by_email(params[:member][:email])
    @petition = Petition.where(:custom_path => params[:petition][:custom_path]).first

    if @member.new_record?
      @member.attributes = params[:member] 
      if not @member.save
        @errors = @member.errors.messages.map do |key, message|
          key.to_s.capitalize + ' ' + message.join(' ') 
        end.join('. ')
        return redirect_to custom_petition_path(@petition.custom_path), :alert => @errors + '.'
      end
    end
    @signature = PetitionSignature.find_or_initialize_by_member_id_and_petition_id(@member.id, @petition.id)
    if @signature.new_record?
      @signature.attributes = params[:petition_signature] 
      @signature.save
      @new_signature = true
    end

    logger.debug("Request type: #{request.xhr?}")

    if @petition.display_donation? 
      render :json => {:hash => 'doe'}
    else
      render :json => {:hash => 'compartilhe'}
    end
  end
end
