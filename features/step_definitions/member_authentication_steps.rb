Given /^I am not logged in$/ do
end

Then /^I should see the login link$/ do
  assert(page.has_css?("a.login"))
end

Then /^I should see the logout link$/ do
  assert(page.has_css?("a.logout"))
end
