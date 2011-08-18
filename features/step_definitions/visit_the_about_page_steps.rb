Then /^I should see the last petition link$/ do
  page.should have_xpath("//a[@href='/na_atividade/#{Petition.last.issue_id}/assine_embaixo/#{Petition.last.custom_path}']")
end

Then /^I should see the last debate link$/ do
  page.should have_xpath("//a[@href='/bate-bola/#{Debate.last.id}']")
end

Then /^I should see the last personal story link$/ do
  page.should have_xpath("//a[@href='/na_atividade/#{PersonalStory.first.issue_id}/direto_da_gema/#{PersonalStory.first.id}']")
end
