Given /^(\d+) ideas exist$/ do |count|
  @ideas ||= []
  count.to_i.times do
    f = Factory.create(:idea)
    @ideas << f
  end
end

Then /^I should see the idea title$/ do
  page.should have_content("#{@ideas.first.title}")
end

Then /^I should see a fork idea button$/ do
  page.should have_css("a[href='#fork']")
end
