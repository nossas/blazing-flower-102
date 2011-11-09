class AddConfirmedAtTimeToMembers < ActiveRecord::Migration
  def change
    omniauth_members = Member.find(:all, :include => :provider_authorizations, :conditions => "provider_authorizations.provider IS NOT null AND confirmed_at IS null")
    omniauth_members.each do |m|
      m.update_attributes(:confirmed_at => Time.now, :has_login => true)
    end
  end
end
