Given /^(\d+) petitions exist$/ do |count|
  count.to_i.times do
    Factory(:petition)
  end
end

Then /^I should see a list of petitions$/ do
  Petition.all.each { |p| And %(I should see "#{p.title}") }
end

Then /^I should see new petition form$/ do
  And %(I should see "Title")
  And %(I should see "Custom path")
  And %(I should see "Headline")
  And %(I should see "Description")
  And %(I should see "Call to action")
end

Then /^I should see a petition preview page$/ do
  assert(page.has_content?("#{Petition.first.headline}"))
  assert(page.has_content?("You're currently viewing the preview of this petition. To publish it, please go back to the Edit page and change its state to Published."))
end

