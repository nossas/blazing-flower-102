Given /^(\d+) complete issues exist$/ do |count|
  count.to_i.times do
    issue = Factory.create(:issue)
    issue.debates << Factory.create(:debate)
    issue.personal_stories << Factory.create(:personal_story)
    issue.petitions << Factory.create(:complete_petition)
  end
end


Then /^I should see the issue name$/ do
  page.should have_content "#{Issue.first.name}"
end



