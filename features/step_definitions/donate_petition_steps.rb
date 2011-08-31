Given /^there is a petition with donation enabled$/ do
  @petition = Factory(:petition_with_donation_enabled).tap{|p| p.publish }
end

Given /^I have already signed this petition$/ do
  @petition.petition_signatures.create :member => Member.first
end

Then /^I should see the petition donation details$/ do
  page.body.should match @petition.donation_headline
  page.body.should match @petition.donation_text
end

Then /^I should see a link to the donation$/ do
  page.should have_css("a.show_taf[href='#doe']")
end
