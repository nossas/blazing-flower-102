Given /^(\d+) petition signatures exist$/ do |count|
  count.to_i.times{ Factory(:petition_signature) }
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

Then /^I should see the first signature having "Comment Accepted" as "Yes"$/ do
  page.find("table.index_table tbody tr:first td:last b").should have_content("Yes")
  page.find("table.index_table tbody tr:first td:last a").should have_content("No")
end

Then /^I should see the first signature having "Comment Accepted" as "No"$/ do
  page.find("table.index_table tbody tr:first td:last b").should have_content("No")
  page.find("table.index_table tbody tr:first td:last a").should have_content("Yes")
end

Then /^the comment should be accepted$/ do
  PetitionSignature.first.comment_accepted.should be_true
end

Then /^the comment should be rejected$/ do
  PetitionSignature.first.comment_accepted.should be_false
end
