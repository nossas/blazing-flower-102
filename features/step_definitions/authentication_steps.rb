When /^I fill in the admin login form$/ do
  fill_in 'user_email', :with => User.first.email
  fill_in 'user_password', :with => '123-test'
end
