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

