class TafsController < ApplicationController
  def show
    @taf = Petition.where(:custom_path => params[:custom_path]).first.taf
  end
end
