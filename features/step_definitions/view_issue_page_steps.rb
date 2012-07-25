Given /^(\d+) complete issues exist$/ do |count|
  count.to_i.times do
    issue = Factory.create(:issue)
    Factory.create(:debate, :issue => issue)
    Factory.create(:personal_story, :issue => issue)
    p = Factory.create(:complete_petition, :issue => issue)
    p.update_attributes({:state => 'published'})
  end
end

Then /^I should see the issue name$/ do
  page.should have_content "#{Issue.first.name}"
end

Given /^there is an issue with a PdP link$/ do
  @issue = Factory.create(:issue, :pdp_link => "http://paneladepressao.org.br/campaigns/39")
end

Then /^I should see the PdP call to action$/ do
  page.should have_css("section.pdp_link")
end
