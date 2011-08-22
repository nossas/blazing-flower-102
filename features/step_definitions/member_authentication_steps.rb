Given /^I am not logged in$/ do
end

And /^homepage content exists$/ do
  Factory(:featured_content_widget)
end
