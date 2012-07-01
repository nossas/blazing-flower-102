class PetitionSignaturesController < ApplicationController
  has_scope :page, default: 1
  has_scope :by_updated_at

  inherit_resources
  optional_belongs_to :issue


  def index
    if params[:email] and params[:petition_id]
      @petition_signature = PetitionSignature.joins(:member).
        where(['members.email = ? AND petition_signatures.petition_id = ?', params[:email], params[:petition_id]]).first
      index! do |format|
        format.json { render json: @petition_signature and return }
      end
    else
      index! do |format|
        if @petition_signatures
          check_mrdash_token
          format.json { render json: @petition_signatures.to_json(:include => :members) }
        end
      end
    end
  end

  def create
    if params[:member].nil? && current_member.nil?
      session[:petition_signature] = params[:petition_signature]
      redirect_to "/members/auth/facebook" and return
    end

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
