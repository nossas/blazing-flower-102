Given /^there is one administrative user$/ do
  Factory.create(:user)
end

Given /^I am logged in to the admin section$/ do
  Factory.create(:user)
  visit admin_path
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
  click_button 'Sign in'
end

When /^I fill in the admin login form$/ do
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
end

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


