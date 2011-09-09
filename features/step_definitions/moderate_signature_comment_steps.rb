# encoding: utf-8
Given /^(\d+) petition signatures exist$/ do |count|
  count.to_i.times{ Factory(:petition_signature) }
end

When /^I click on the "Comments" link under Petitions$/ do
  page.find(:css, "li#peties ul a").click
end

Then /^I should see a list of petition signatures$/ do
  assert(page.has_content?(PetitionSignature.first.comment.to_s))
  assert(page.has_content?(PetitionSignature.last.comment.to_s))
end

Given /^the first comment is rejected$/ do
  PetitionSignature.first.reject_comment
end

Given /^the first comment is accepted$/ do
  PetitionSignature.first.accept_comment
end

Then /^I should see the first signature having "Comment Accepted" as "Sim"$/ do
  page.find("table.index_table tbody tr:first td:last b").should have_content("Sim")
  page.find("table.index_table tbody tr:first td:last a").should have_content("Não")
end

Then /^I should see the first signature having "Comment Accepted" as "Não"$/ do
  page.find("table.index_table tbody tr:first td:last b").should have_content("Não")
  page.find("table.index_table tbody tr:first td:last a").should have_content("Sim")
end

Then /^the comment should be accepted$/ do
  PetitionSignature.first.comment_accepted.should be_true
end

Then /^the comment should be rejected$/ do
  PetitionSignature.first.comment_accepted.should be_false
end
