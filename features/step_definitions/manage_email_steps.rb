Given /^(\d+) autofire emails exist$/ do |count|
  count.to_i.times do
    Factory(:autofire_email)
  end
end

When /^I select the first Petition$/ do
  When %(I select "#{Petition.first.title}" from "Petition")
end

Then /^I should see a list of emails$/ do
  AutofireEmail.all.each { |p| And %(I should see "#{p.subject}") }
end

Then /^I should see a new autofire email form$/ do
  And %(I should see "Petition")
  And %(I should see "From")
  And %(I should see "Subject")
  And %(I should see "Message")
end
