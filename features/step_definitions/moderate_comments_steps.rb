Given /^(\d+) comments are in the moderation queue$/ do |count|
  count.to_i.times{ Factory(:comment_awaiting_moderation) }
end

Then /^I should see a list of comments$/ do
  assert(page.has_content?(Comment.first.content.to_s))
  assert(page.has_content?(Comment.last.content.to_s))
end

