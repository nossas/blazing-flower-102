Given /^(\d+) ideas exist$/ do |count|
  @ideas ||= []
  count.to_i.times do
    f = Factory.create(:idea)
    @ideas << f
  end
end

Given /^I have (\d+) idea category$/ do |count|
  @categories ||= []
  count.to_i.times do
    f = Factory.create(:idea_category)
    @categories << f
  end
end

Given /^I have (\d+) idea help method$/ do |count|
  @help_methods ||= []
  count.to_i.times do
    f = Factory.create(:idea_help_method)
    @help_methods << f
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

When /^I fill in my idea information$/ do
  page.execute_script("$('#facebox input#idea_title').val('test idea')");
  page.execute_script("$('#facebox textarea#idea_headline').val('headline for the test idea')");
  page.execute_script("$('option[value=#{@categories.first.id}]', '#facebox select#idea_idea_category_id').attr('selected', 'selected')");

  page.execute_script("$('option[value=#{@help_method.first.id}]', '#facebox select#idea_idea_help_method_id').attr('selected', 'selected')");

  page.execute_script("$('#facebox form').submit()");
  sleep 2
end

Then /^My idea should be created for that issue$/ do
  Idea.find_by_title('test idea').should_not be_nil
end
