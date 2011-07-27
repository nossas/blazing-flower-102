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
  And %{I select "#{Issue.first.name}" from "Issue"}
  And %{I fill in "Title" with "Bonzai!"}
  And %{I fill in "Video embed code" with "123"}
  And %{I select "Petition" from "personal_story_connected_action"}
end

