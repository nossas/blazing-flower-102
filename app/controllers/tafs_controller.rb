class TafsController < ApplicationController
  def show
    raise params.to_yaml
    @taf = Petition.where(:custom_path => params[:custom_path]).first.taf
  end
end
