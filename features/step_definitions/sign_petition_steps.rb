# coding: utf-8
Given /^(\d+) published petitions exist$/ do |count|
  count.to_i.times do
    f = Factory.create(:complete_petition).tap{|p| p.publish }
    f.save
  end
end

Given /^(\d+) complete petitions exist$/ do |count|
  count.to_i.times do
    Factory.create(:complete_petition)
  end
end

Given /^I am an existing member$/ do
  Factory.create(:member)
end

Given /^I have signed the first petition$/ do
  PetitionSignature.create! :member => Member.first, :petition => Petition.first
end

When /^I enter my information in the petition signature form$/ do
  fill_in "member_email", :with => "diogo@biazus.me"
  sleep 2
  fill_in "member_first_name", :with => "Diogo"
  fill_in "member_last_name", :with => "Biazus"
end

When /^I enter my member information in the petition signature form$/ do
  fill_in "member_email", :with => Member.first.email
  fill_in "member_first_name", :with => "Diogo"
  fill_in "member_last_name", :with => "Biazus"
end

When /^I press the submit button$/ do
  click_button "#{Petition.first.call_to_action}"
end

Then /^I should see a thank\-you message$/ do
  assert(page.has_content?("#{Petition.first.taf.thank_you_headline}"))
  assert(page.has_content?("#{Petition.first.taf.thank_you_text}"))
end

Then /^I should see the petition title$/ do
  page.should have_content("#{Petition.first.headline.upcase}")
end

Then /^I should see a petition signature form$/ do
  assert(page.has_css?("form#new_petition_signature"))
end

Then /^I should see inline errors$/ do
  assert(page.has_content?("Campo obrigatório"))
end

Then /^I should see a link to the TAF$/ do
  page.should have_css("a.show_taf[href='#compartilhe']")
end
