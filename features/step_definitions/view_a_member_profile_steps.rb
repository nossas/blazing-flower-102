Given /^there is a member where 'Meu Rio is' slogan is "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :meu_rio_is => arg1)
end

Given /^there is a member without 'Meu Rio is' slogan$/ do
  @member = Factory(:member, :meu_rio_is => nil)
end

Given /^there is a member called "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :first_name => arg1)
end


Given /^this member commented the petition "([^"]*)" with "([^"]*)" on "([^"]*)" for the issue "([^"]*)"$/ do |petition_title, comment, comment_date, issue_name|
  @issue = Factory(:issue, :name => issue_name)
  @petition = Factory(:complete_petition, :title => petition_title, :issue => @issue)
  @petition.publish
  @petition_signature = Factory(:petition_signature, :petition => @petition, :comment => comment, :created_at => Date.parse(comment_date), :member => @member)
end

Then /^I should see the petition comment icon$/ do
  page.should have_xpath("//img[@src=\"/assets/01_petition_icon.png\"]")
end

Given /^this member commented the debate "([^"]*)" with "([^"]*)" on "([^"]*)" for the issue "([^"]*)"$/ do |debate_title, comment, comment_date, issue_name|
  Factory(:provider_authorization, :member => @member)
  @issue = Factory(:issue, :name => issue_name)
  @debate = Factory(:debate, :title => debate_title, :issue => @issue)
  @comment = Factory(:debate_comment, :commentable => @debate, :member => @member, :content => comment, :created_at => Date.parse(comment_date))
end

Then /^I should see the debate comment icon$/ do
  page.should have_xpath("//img[@src=\"/assets/02_debate_icon.png\"]")
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |arg1, arg2|
  page.body.should match(/#{arg1}[\s\w\d\W]*#{arg2}/)
end

Given /^there is a member without bio$/ do
  @member = Factory(:member, :bio => nil)
end
