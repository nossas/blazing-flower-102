Given /^(\d+) published petitions exist$/ do |count|
  count.to_i.times do
    f = Factory.create(:complete_petition).tap{|p| p.publish }
    f.save
  end
end

Given /^I am an existing member$/ do
  Factory.create(:member)
end

Given /^I have signed the first petition$/ do
  PetitionSignature.create! :member => Member.first, :petition => Petition.first
end

When /^I enter my information in the petition signature form$/ do
  fill_in "member_name", :with => "Diogo"
  fill_in "member_email", :with => "diogo@biazus.me"
  select "Centro", :from => "member_zona"
end

When /^I enter my member information in the petition signature form$/ do
  fill_in "member_name", :with => Member.first.name
  fill_in "member_email", :with => Member.first.email
end

When /^I press the submit button$/ do
  click_button "#{Petition.first.call_to_action}"
end

Then /^I should see a thank\-you message$/ do
  assert(page.has_content?("#{Petition.first.taf.thank_you_headline}"))
  assert(page.has_content?("#{Petition.first.taf.thank_you_text}"))
end

Then /^I should see the petition title$/ do
  assert(page.has_content?("#{Petition.first.headline}"))
end

Then /^I should see a petition signature form$/ do
  assert(page.has_css?("form#new_petition_signature"))
end

