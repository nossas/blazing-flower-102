Given /^there is one administrative user$/ do
  Factory.create(:user)
end

Given /^I am logged in to the admin section$/ do
  Factory.create(:user)
  visit 'admin'
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
  click_button 'Sign in'
end

When /^I fill in the admin login form$/ do
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
end

