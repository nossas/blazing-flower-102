class PetitionsController < ApplicationController
  def show
    @petition = Petition.where(:custom_path => params[:custom_path]).first
    return render_404 unless @petition and @petition.state == 'published'

    @taf = @petition.taf
    @petition_signature = PetitionSignature.new
    @member = Member.new
  end
end
