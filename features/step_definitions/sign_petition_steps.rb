Given /^(\d+) complete petitions exist$/ do |count|
  count.to_i.times do
    Factory.create(:complete_petition)
  end
end

When /^I enter my information in the petition signature form$/ do
  fill_in "member_name", :with => "Diogo"
  fill_in "member_email", :with => "diogo@biazus.me"
end

When /^I press the submit button$/ do
  click_button "#{Petition.first.call_to_action}"
end

Then /^I should see a thank\-you message$/ do
  page.has_content? "#{Petition.first.tafs.first.thank_you_headline}"
  page.has_content? "#{Petition.first.tafs.first.thank_you_text}"
end

Then /^I should see the petition title$/ do
  page.has_content? "#{Petition.first.headline}"
end

Then /^I should see a petition signature form$/ do
  page.has_content? "form#new_petition_signature"
end


