# coding: utf-8
Given /^(\d+) idea help method exist$/ do |count|
  count.to_i.times do |i|
    Factory.create(:idea_help_method)
    Factory.create(:idea)
  end
end

Then /^I should see a list of ideas help methods$/ do
  page.should have_content("#{IdeaHelpMethod.first.name}")
  page.should have_content("#{IdeaHelpMethod.last.name}")
end

Then /^I should see new idea help method form$/ do
  And %(I should see "Campanha")
  And %(I should see "Nome")
end
