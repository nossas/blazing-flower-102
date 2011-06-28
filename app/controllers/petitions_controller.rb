class PetitionsController < ApplicationController
  def show
    @petition = Petition.where(:custom_path => params[:custom_path]).first
  end
end
