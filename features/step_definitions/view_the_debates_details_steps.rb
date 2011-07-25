Given /^There is a commented debate$/ do
  @comment = Factory(:debate_comment, :member => Factory(:member, :first_name => "Bruno", :last_name => "Jurkovski"))
end

Then /^I should see the debate comment$/ do
  page.should have_content @comment.member.first_name
end

Then /^I should see the new comment form$/ do
  page.should have_selector("form#new_comment")
end
