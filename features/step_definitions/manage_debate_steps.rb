Given /^(\d+) debates exist$/ do |count|
  count.to_i.times{ Factory(:debate) }  
end

Given /^(\d+) members exist$/ do |count|
  count.to_i.times{ Factory(:member) }
end

Then /^I should see the debate index page$/ do
  assert(page.has_content?("#{Debate.first.question}"))
  assert(page.has_content?("#{Debate.first.author_email_side_1}"))
end

Then /^I fill in the debate form with correct information$/ do
  fill_in 'Question', :with => "Why are we writing tests for this?"
  fill_in 'debate[author_email_side_1]', :with => Member.first.email
  fill_in 'debate[author_email_side_2]', :with => Member.last.email
  fill_in 'debate[title]', :with => "Debate title"
end

Then /^I fill in the debate form with incorrect information$/ do
  fill_in 'Question', :with => "Why are we writing tests for this?"
  fill_in 'debate[author_email_side_1]', :with => Member.first.email
  fill_in 'debate[author_email_side_2]', :with => "notarealperson@example.org.br"
end

