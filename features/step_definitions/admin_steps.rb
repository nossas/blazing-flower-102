Given /^there is one administrative user$/ do
  Factory.create(:admin)
end

Given /^I am logged in to the admin section$/ do
  Factory.create(:admin)
  visit admin_dashboard_path
  fill_in 'admin_user_email', :with => AdminUser.first.email
  fill_in 'admin_user_password', :with => '123-test'
  click_button 'Login'
end
