Given /^I have logged in previously through Facebook$/ do
  Factory.create(:provider_authorization)
end

When /^I fill in the new member form$/ do
  fill_in "member_first_name", :with => "John"
  fill_in "member_last_name", :with => "Smith"
  fill_in "member_email", :with => "john@example.com"
  fill_in "member_password", :with => "wordpass"
  fill_in "member_password_confirmation", :with => "wordpass"
end

When /^I fill in the new member form with the same email$/ do
  fill_in "member_first_name", :with => "#{Member.first.first_name}"
  fill_in "member_last_name", :with => "#{Member.first.last_name}"
  fill_in "member_email", :with => "#{Member.first.email}"
  fill_in "member_password", :with => "wordpass"
  fill_in "member_password_confirmation", :with => "wordpass"
end

Then /^I should see a new member form$/ do
  page.should have_css("form#member_new")
end

Then /^I should see the homepage$/ do
  page.should have_content('De Olho No Legislativo')
  page.should have_content('Quer nos')
  page.should have_content('Ajudar a construir')
  page.should have_content('Rio Mais Justo?')
end

