Given /^there are (\d+) personal stories connected to the issue$/ do |count|
  count.to_i.times do
    issue = Issue.first
    Factory.create(:personal_story, :issue => issue)
  end
end

When /^I click on a thumbnail for a video$/ do
  page.find(:css, "#story-#{PersonalStory.last.id} .thumbnail").click
end

When /^I click on another thumbnail for a video$/ do
  page.find(:css, "#story-#{PersonalStory.all[1].id} .thumbnail").click
end

When /^I press the back button$/ do
  page.execute_script('history.back()')
end

Then /^I should see a video$/ do
 page.should have_xpath('//iframe')
end

Then /^I should see the first video's title$/ do
  page.should have_content("#{PersonalStory.first.title}")
end

Then /^I should see the other stories' thumbnails$/ do
  page.should have_css('.thumbnail')
  page.should have_xpath('//img')
end

Then /^I should see the selected video's title$/ do
  page.should have_content("#{PersonalStory.last.title}")
end

Then /^I should see the selected video's description$/ do
  page.should have_content("#{PersonalStory.last.description}")
end

Then /^I should see the first video's description$/ do
  page.should have_content("#{PersonalStory.first.description}")
end

Then /^I should see that video's title$/ do
  page.should have_content("#{PersonalStory.last.title}")
end

Then /^I should see that video's description$/ do
  page.should have_content("#{PersonalStory.last.description}")
end


