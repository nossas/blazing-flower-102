Given /^(\d+) debates exist$/ do |count|
  count.to_i.times{ Factory(:debate) }  
end

Given /^(\d+) members exist$/ do |count|
  count.to_i.times{ Factory(:member) }
end

Then /^I should see the debate index page$/ do
  page.should have_content("#{Debate.first.question}")
end

Then /^I fill in the debate form with correct information$/ do
  fill_in 'debate[question]', :with => "Why are we writing tests for this?"
  fill_in 'debate[author_email_side_1]', :with => Member.first.email
  fill_in 'debate[author_email_side_2]', :with => Member.last.email
  fill_in 'debate[title]', :with => "Debate title"
  fill_in 'debate[comment_prompt]', :with => "This will inspire people do make inteligent comments"
  select(Issue.first.name, :from => 'debate[issue_id]')
end

Then /^I fill in the debate form with incorrect information$/ do
  fill_in 'debate[question]', :with => "Why are we writing tests for this?"
  fill_in 'debate[author_email_side_1]', :with => Member.first.email
  fill_in 'debate[author_email_side_2]', :with => "notarealperson@example.org.br"
end

