Given /^there is a petition with donation enabled$/ do
  @petition = Factory(:complete_petition, :donation_thanks_message => 'donation thanks', :donation_headline => 'donation help', :donation_text => 'donation text').tap{|p| p.publish }
  @petition.update_attributes :display_donation => true
end

Given /^I have already signed this petition$/ do
  @petition.petition_signatures.create :member => Member.first
end

Then /^I should see the petition donation details$/ do
  page.body.should match @petition.donation_thanks_message
  page.body.should match @petition.donation_headline
  page.body.should match @petition.donation_text
end
