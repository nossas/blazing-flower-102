When /^I fill out the new User form$/ do
  fill_in "user_first_name", :with => "Nicolas"
  fill_in "user_last_name", :with => "Iensen"
  fill_in "user_email", :with => "johnson@denmark.de"
  fill_in "user_password", :with => "unsafe_password"
end

Then /^I should see a list of administrative users$/ do
  page.has_content? User.first.first_name
  page.has_content? User.last.first_name
end

Then /^I should see a new User form$/ do
  page.has_content? "Add a new user"
  page.has_content? "form#new_user"
end
