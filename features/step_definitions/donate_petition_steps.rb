Given /^there is a petition with donation enabled$/ do
  @petition = Factory(:petition_with_donation_enabled)
  @petition.publish
end

Given /^I have already signed this petition$/ do
  @petition.petition_signatures.create :member => Member.first
end

Then /^I should see the petition donation details$/ do
  page.body.should match @petition.donation_headline
  page.body.should match @petition.donation_text
end
