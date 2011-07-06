class TafsController < ApplicationController
  def show
    petition = Petition.where(:custom_path => params[:custom_path]).first
    return render_404 unless petition and petition.state == 'published'

    @taf = petition.taf
  end
end
