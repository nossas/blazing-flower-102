# coding: utf-8
class PetitionsController < ApplicationController
  before_filter do
    @petition = Petition.where(:custom_path => params[:custom_path]).first
    return render_404 unless @petition and ( @petition.published? or @petition.archived? )
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

  def share_with_friends
    graph = Koala::Facebook::GraphAPI.new(current_member.facebook_authorization.token)
    begin
      graph.put_wall_post(params[:message], {:link => issue_custom_petition_url(@petition.issue, @petition.custom_path)}, params[:friend_id])
    rescue
    end
    render :js => @petition.to_json, :status => :created
  end
end
