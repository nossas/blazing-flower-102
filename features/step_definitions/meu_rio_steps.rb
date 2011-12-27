Given /^there is an issue$/ do
  @issue = Factory.create(:issue)
end

Given /^there is an issue with letters enabled$/ do
  @issue = Factory.create(:issue, :letters_enabled => true)
end
