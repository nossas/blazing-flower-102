Given /^there are (\d+) admin users$/ do |count|
  count.to_i.times do
    Factory.create(:user)
  end 
end

When /^I fill out the new User form$/ do
  fill_in "user_first_name", :with => "Nicolas"
  fill_in "user_last_name", :with => "Iensen"
  fill_in "user_email", :with => "johnson@denmark.de"
  fill_in "user_password", :with => "no_one_will_guess_this"
  fill_in "user_password_confirmation", :with => "no_one_will_guess_this"
  attach_file("user_avatar", "#{Rails.root}/features/fixtures/avatar.png")
end

When /^I fill in the edit user form$/ do
  fill_in "user_first_name", :with => "Harold"
  fill_in "user_last_name", :with => "Kerzner"
  fill_in "user_email", :with => "projectmanager@kerzner.com"
  fill_in "user_password", :with => "no_one_will_guess_this"
  fill_in "user_password_confirmation", :with => "no_one_will_guess_this"
  attach_file("user_avatar", "#{Rails.root}/features/fixtures/avatar.png")
end

When /^I fill in the edit user form without the password field$/ do
  fill_in "user_first_name", :with => "Harold"
  fill_in "user_last_name", :with => "Kerzner"
  fill_in "user_email", :with => "projectmanager@kerzner.com"
  attach_file("user_avatar", "#{Rails.root}/features/fixtures/avatar.png")
end

Then /^I should see a list of administrative users$/ do
  page.has_content? User.first.first_name
  page.has_content? User.last.first_name
end

Then /^I should see a new User form$/ do
  page.has_content? "Add a new user"
  page.has_content? "form#new_user"
end

Then /^I should see an edit User form$/ do
  page.has_content? "Edit User"
  page.has_content? "form#edit_user"
end

Given /^there is one activated user$/ do
  Factory.create(:user)
end

When /^I follow the first activated user$/ do
  click_link "edit_user_#{User.where(:active => true).last.id}"
end

Then /^I should see user avatar$/ do
  page.should have_xpath("//img[@id=\"user_avatar\"]")
  page.should_not have_xpath("//img[@src=\"/avatars/original/missing.png\"]")
end
