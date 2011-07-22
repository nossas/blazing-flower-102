Given /^(\d+) comments? (are|is) in the moderation queue$/ do |count,tobe|
  @comments_awaiting_moderation = []
  count.to_i.times{ @comments_awaiting_moderation.push(Factory(:comment_awaiting_moderation)) }
end

Then /^I should see a list of comments$/ do
  assert(page.has_content?(Comment.first.content.to_s))
  assert(page.has_content?(Comment.last.content.to_s))
end

Given /^(\d+) comment is not in the moderation queue$/ do |count|
  @comments = []
  count.to_i.times{ @comments.push(Factory(:debate_comment)) }
end

Then /^I should see only the first comment$/ do
  assert(page.has_content?(Comment.first.content.to_s))
  assert(!page.has_content?(Comment.last.content.to_s))
end

Given /^(\d+) comments? (are|is) moderated$/ do |count,tobe|
  @moderated_comments = []
  count.to_i.times{ @moderated_comments.push(Factory(:moderated_comment)) }
end

Then /^I should see only the moderated comment$/ do
  @moderated_comments.each do |c|
    page.should have_content(c.content.to_s)
  end
  @comments_awaiting_moderation.each do |c|
    page.should_not have_content(c.content.to_s)
  end
end

Given /^the first debate comment is accepted$/ do
  Comment.first.accept
end

Given /^the first debate comment is rejected$/ do
  Comment.first.reject
end

Then /^I should see the first comment having "Comment Accepted" as "Yes"$/ do
  page.find("table.index_table tbody tr:first td:last b").should have_content("Yes")
  page.find("table.index_table tbody tr:first td:last a").should have_content("No")
end

Then /^I should see the first comment having "Comment Accepted" as "No"$/ do
  page.find("table.index_table tbody tr:first td:last b").should have_content("No")
  page.find("table.index_table tbody tr:first td:last a").should have_content("Yes")
end

Then /^the first debate comment should be accepted$/ do
  Comment.first.comment_accepted.should be_true
end

Then /^the first debate comment should be rejected$/ do
  Comment.first.comment_accepted.should be_false
end
