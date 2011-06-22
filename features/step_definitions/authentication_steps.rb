When /^I fill in the admin login form$/ do
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
end

Given /^there is one deactivated user$/ do
  Factory.create(:deactivated)
end
