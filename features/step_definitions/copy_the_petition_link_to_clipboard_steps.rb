Given /^there is a petition with display copy link enabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:copy_url_taf, :petition => petition)
  petition.publish
end

Given /^there is a petition with display copy link disabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:taf, :petition => petition, :display_copy_url => false)
  petition.publish
end
