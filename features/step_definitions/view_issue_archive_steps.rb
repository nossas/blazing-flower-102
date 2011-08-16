Then /^I should see the issue's first debate's title$/ do
  page.should have_content("#{Issue.last.debates.first.title}")
end

Then /^I should see the issue's first personal story's title$/ do
  page.should have_content("#{Issue.last.personal_stories.first.title}")
end

Then /^I should see the issue's first petition's headline$/ do
  page.should have_content("#{Issue.last.petitions.first.headline}")
end

When /^I press the issue's name$/ do
  find(".dropdown dt").click
end

When /^I click the other issue's name$/ do
  find(".dropdown dd ul li a.issue-#{Issue.first.id}").click
end

Then /^I should see the other issue's title$/ do
  page.should have_content("#{Issue.first.name}")
end

Then /^I should see the other issue's first debate's title$/ do
  page.should have_content("#{Issue.first.debates.first.title}")
end

Then /^I should not see the original issue's first debate's title$/ do
  page.should_not have_content("#{Issue.last.debates.first.title}")
end


