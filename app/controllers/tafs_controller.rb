class TafsController < ApplicationController
  def show
    @taf = Petition.find_by_custom_path(params[:custom_path]).taf

    render :partial => "petitions/taf", :layout => false, :content_type => "text/html"
  end
end
