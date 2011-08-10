Given /^there is a member where 'Meu Rio is' slogan is "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :meu_rio_is => arg1)
end

Given /^there is a member without 'Meu Rio is' slogan$/ do
  @member = Factory(:member, :meu_rio_is => nil)
end

Given /^there is a member called "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :first_name => arg1)
end

Given /^this member commented the petition "([^"]*)" with "([^"]*)" on "([^"]*)"$/ do |petition_title, comment, comment_date|
  @petition = Factory(:complete_petition, :title => petition_title)
  @petition.publish
  @petition_signature = Factory(:petition_signature, :petition => @petition, :comment => comment, :created_at => Date.parse(comment_date), :member => @member)
end

Then /^I should see the petition comment icon$/ do
  page.should have_xpath("//img[@src=\"/assets/petition_icon.png\"]")
end
