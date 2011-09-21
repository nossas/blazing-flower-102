Given /^(\d+) personal stories exist$/ do |count|
  count.to_i.times do
    Factory(:personal_story)
  end
end

Then /^I should see the personal story index page$/ do
  And %{I should see "#{PersonalStory.first.title}"}
  And %{I should see "#{PersonalStory.last.title}"}
end

When /^I fill in the personal story form with correct information$/ do
  And %{I select "#{Issue.first.name}" from "Campanha"}
  And %{I fill in "personal_story[title]" with "Bonzai!"}
  And %{I fill in "personal_story[excerpt]" with "Aloha!"}
  And %{I fill in "personal_story[description]" with "Aloha!"}
  And %{I fill in "personal_story[video_url]" with "http://vimeo.com/26694098"}
  And %{I select "Petition" from "personal_story_connected_action"}
end

