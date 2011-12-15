# encoding: utf-8
Given /^(\d+) issues exist$/ do |count|
  @issues = []
  count.to_i.times do
    @issues << Factory.create(:issue)
  end
end

Then /^I should see a list of issues$/ do
  assert(page.has_content?("#{Issue.first.name}"))
  assert(page.has_content?("#{Issue.last.name}"))
end

Then /^I should see new issue form$/ do
  And %(I should see "Nome")
  And %(I should see "Excerto")
  And %(I should see "Descrição")
  And %(I should see "Image")
end


