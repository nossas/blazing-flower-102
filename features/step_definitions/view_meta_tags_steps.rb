Given /^I'm in the home page$/ do
  visit root_path
end

Then /^I should see the meta tag for description$/ do
  page.has_xpath?('//meta[@description]')
end

Then /^I should see the meta tag for keywords$/ do
  page.has_xpath?('//meta[@keywords]')
end

Then /^I should see the meta tag for author$/ do
  page.has_xpath?('//meta[@author]')
end

When /^I visit the issue page$/ do
  visit issue_path(@issue) if @issue
end
