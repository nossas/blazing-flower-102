class PetitionsController < ApplicationController
  def show
    @petition = Petition.where(:custom_path => params[:custom_path]).first
    return render_404 unless @petition and @petition.state == 'published'

    @ok_to_display_counter = (@petition.display_counter && (@petition.petition_signatures.count >= @petition.counter_threshold))

    @petition_signature = PetitionSignature.new
    @member = Member.new
  end
end
