Given /^there is one administrative user$/ do
  Factory.create(:user)
end

Given /^I am logged in to the admin section$/ do
  Factory.create(:admin)
  visit admin_path
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
  click_button 'Sign in'
end
