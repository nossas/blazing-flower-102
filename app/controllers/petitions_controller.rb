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
    params[:friends_ids].each do |friend_id|
      graph.put_wall_post(params["message_#{friend_id}"], {:link => params[:link]}, friend_id)
    end
    redirect_to issue_custom_petition_path(@petition.issue, @petition.custom_path)
  end
end
