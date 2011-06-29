class PetitionSignaturesController < ApplicationController
  def create
    #do we want to allow members to sign the same petition multiple times? 
    #right now we're assuming that we don't

    
    @member = Member.find_or_initialize_by_email(params[:member][:email])
    if @member.new_record?
      @member.attributes = params[:member] 
      if @member.save
        redirect_to custom_taf_path(params[:petition][:custom_path])
      else 
        render :action => 'petition/show'
      end
    else
    end
  end
end
