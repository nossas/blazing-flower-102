class PetitionsController < ApplicationController
  def show
    @petition = Petition.where(:custom_path => params[:custom_path]).first
    return render_404 unless @petition and @petition.state == 'published'

    @comments = @petition.petition_signatures.where(:comment_accepted => true).limit(3)
    @taf = @petition.taf
    @petition_signature = PetitionSignature.new
    @member = Member.new
  end
end
