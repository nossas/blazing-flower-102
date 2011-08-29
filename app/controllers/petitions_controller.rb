class PetitionsController < ApplicationController
  before_filter do
    @petition = Petition.where(:custom_path => params[:custom_path]).first
    return render_404 unless @petition and @petition.published?
  end

  def show
    @comments = @petition.petition_signatures.where("comment_accepted = true AND comment != ''").order('created_at DESC').limit(3)
    @taf = @petition.taf
    @petition_signature = PetitionSignature.new
    @member = current_member || Member.new
  end

  def donate
    render :partial => 'donation'
  end
end
