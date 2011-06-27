Given /^(\d+) Tell a Friend pages exist$/ do |count|
  count.to_i.times do
    Factory(:taf)
  end
end

When /^I fill out the taf form$/ do
  And %(I select the first Petition)
  fill_in "Thank you headline", :with => "Thanks for signing!"
  fill_in "Thank you text", :with => "Obrigado!"
end


Then /^I should see a list of tafs/ do
  Taf.all.each { |t| And %(I should see "#{t.thank_you_headline}") }
end

Then /^I should see a new taf form$/ do
  And %(I should see "Petition")
  And %(I should see "Thank you headline")
  And %(I should see "Thank you text")
end
