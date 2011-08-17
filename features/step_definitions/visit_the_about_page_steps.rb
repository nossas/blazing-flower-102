Then /^I should see the last petition link$/ do
  page.should have_xpath("//a[@href='/issues/#{Petition.last.issue_id}/petition/#{Petition.last.custom_path}']")
end

Then /^I should see the last debate link$/ do
  page.should have_xpath("//a[@href='/debates/#{Debate.last.id}']")
end

Then /^I should see the last personal story link$/ do
  page.should have_xpath("//a[@href='/issues/#{PersonalStory.first.issue_id}/personal_stories/#{PersonalStory.first.id}']")
end
