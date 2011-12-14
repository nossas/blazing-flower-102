# coding: utf-8
Given /^(\d+) idea category exist$/ do |count|
  count.to_i.times do |i|
    Factory.create(:idea_category)
    Factory.create(:idea)
  end
end

Then /^I should see a list of ideas categories$/ do
  page.should have_content("#{IdeaCategory.first.name}")
  page.should have_content("#{IdeaCategory.last.name}")
end

Then /^I should see new idea category form$/ do
  And %(I should see "Nome")
  And %(I should see "Badge")
end
