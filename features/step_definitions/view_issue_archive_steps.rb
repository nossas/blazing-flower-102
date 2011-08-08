Then /^I should see the issue's first debate's title$/ do
  page.should have_content("#{Issue.last.debates.first.title}")
end

Then /^I should see the issue's first personal story's title$/ do
  page.should have_content("#{Issue.last.personal_stories.first.title}")
end

Then /^I should see the issue's first petition's headline$/ do
  page.should have_content("#{Issue.last.petitions.first.headline}")
end

