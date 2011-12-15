Given /^there is a member where 'Meu Rio is' slogan is "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :meu_rio_is => arg1)
end

Given /^there is a member who lives in the "([^"]*)" zone, his email is "([^"]*)" and his 'Meu Rio is' slogan is "([^"]*)"$/ do |arg1, arg2, arg3|
  @member = Factory(:member, :zona => arg1, :email => arg2, :meu_rio_is => arg3)
end

Given /^there is a member without 'Meu Rio is' slogan$/ do
  @member = Factory(:member, :meu_rio_is => nil)
end

Given /^there is a member called "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :first_name => arg1, :confirmed_at => Date.parse("25/06/2011"))
end


Given /^this member commented the petition "([^"]*)" with "([^"]*)" on "([^"]*)" for the issue "([^"]*)"$/ do |petition_title, comment, comment_date, issue_name|
  @issue = Factory(:issue, :name => issue_name)
  @petition = Factory(:complete_petition, :title => petition_title, :issue => @issue)
  @petition.publish
  @petition_signature = Factory(:petition_signature, :petition => @petition, :comment => comment, :created_at => Date.parse(comment_date), :member => @member)
end

Given /^this member commented the debate "([^"]*)" with "([^"]*)" on "([^"]*)" for the issue "([^"]*)"$/ do |debate_title, comment, comment_date, issue_name|
  Factory(:provider_authorization, :member => @member)
  @issue = Factory(:issue, :name => issue_name)
  @debate = Factory(:debate, :title => debate_title, :issue => @issue)
  @comment = Factory(:debate_comment, :commentable => @debate, :member => @member, :content => comment, :created_at => Date.parse(comment_date))
end

Given /^there is a member without bio$/ do
  @member = Factory(:member, :bio => nil)
end

Given /^my email is "([^"]*)"$/ do |arg1|
  @member = ProviderAuthorization.find_by_uid("547955110").member
  @member.update_attributes :email => arg1
end

Given /^my zone is "([^"]*)"$/ do |arg1|
  @member = ProviderAuthorization.find_by_uid("547955110").member
  @member.update_attributes :zona => arg1
end

Given /^this member had an idea called "([^"]*)" on "([^"]*)" for the issue "([^"]*)"$/ do |title, created_at, issue|
  Factory(:provider_authorization, :member => @member)
  @idea = Factory(:idea, :member => @member, :title => title, :created_at => Date.parse(created_at), :issue => Factory(:issue, :name => issue))
end

Given /^this member remixed an idea called "([^"]*)" on "([^"]*)" for the issue "([^"]*)" by "([^"]*)"$/ do |title, created_at, issue, member|
  Factory(:provider_authorization, :member => @member)
  @original_member = Factory(:member, :first_name => member.split[0], :last_name => member.split[1])
  @idea = Factory(:idea, :parent => Factory(:idea, :member => @original_member),:member => @member, :title => title, :created_at => Date.parse(created_at), :issue => Factory(:issue, :name => issue))
end

Then /^I should see the debate comment icon$/ do
  page.should have_xpath("//img[@src=\"/assets/02_debate_icon.png\"]")
end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |arg1, arg2|
  page.body.should match(/#{arg1}[\s\w\d\W]*#{arg2}/)
end

Then /^I should see the change picture button$/ do
  page.should have_xpath("//a[@id=\"change_picture_btn\"]")
end

Then /^I should see the change name button$/ do
  page.should have_xpath("//a[@id=\"change_name_btn\"]")  
end

Then /^I should see the change email button$/ do
  page.should have_xpath("//a[@id=\"change_email_btn\"]")  
end

Then /^I should see the change zone button$/ do
  page.should have_xpath("//a[@id=\"change_zone_btn\"]")  
end

Then /^I should see the change bio button$/ do
  page.should have_xpath("//a[@id=\"change_bio_btn\"]")  
end

Then /^I should see the change Meu Rio is\.\.\. button$/ do
  page.should have_xpath("//a[@id=\"change_meu_rio_is_btn\"]")  
end

Then /^I should not see the change picture button$/ do
  page.should_not have_xpath("//a[@id=\"change_picture_btn\"]")
end

Then /^I should not see the change name button$/ do
  page.should_not have_xpath("//a[@id=\"change_name_btn\"]")  
end

Then /^I should not see the change email button$/ do
  page.should_not have_xpath("//a[@id=\"change_email_btn\"]")  
end

Then /^I should not see the change zone button$/ do
  page.should_not have_xpath("//a[@id=\"change_zone_btn\"]")  
end

Then /^I should not see the change bio button$/ do
  page.should_not have_xpath("//a[@id=\"change_bio_btn\"]")  
end

Then /^I should not see the change Meu Rio is\.\.\. button$/ do
  page.should_not have_xpath("//a[@id=\"change_meu_rio_is_btn\"]")  
end

Then /^I should see the petition comment icon$/ do
  page.should have_xpath("//img[@src=\"/assets/01_petition_icon.png\"]")
end

Then /^I should see the idea icon$/ do
  page.should have_xpath("//img[@src=\"/assets/imagine.png\"]")
end
