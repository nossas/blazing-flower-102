Given /^(\d+) ideas exist$/ do |count|
  @ideas ||= []
  count.to_i.times do
    f = Factory.create(:idea)
    @ideas << f
  end
end

Then /^I should see the idea title$/ do
  page.should have_content("#{@ideas.first.title}")
end

Then /^I should see a fork idea button$/ do
  page.should have_css("a[href='#fork']")
end

Then /^I should see the login dialog$/ do
  page.evaluate_script("$('#facebox .meu_rio_login:visible').length").should == 1
end

Then /^I should see the fork dialog$/ do
  page.evaluate_script("$('#facebox form[name=fork_idea]:visible').length").should == 1
end

Then /^I should see the new idea dialog$/ do
  page.evaluate_script("$('#facebox form[name=new_idea]:visible').length").should == 1
end
