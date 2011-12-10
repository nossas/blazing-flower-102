Given /^(\d+) ideas exist$/ do |count|
  @ideas ||= []
  count.to_i.times do
    f = Factory.create(:idea)
    @ideas << f
  end
end

Then /^I should see the idea title$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a fork idea button$/ do
  pending # express the regexp above with the code you wish you had
end
