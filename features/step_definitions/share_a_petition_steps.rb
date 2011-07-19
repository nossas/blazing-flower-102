Given /^there is a petition with Facebook share enabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:facebook_taf, :petition => petition)
  petition.publish
end

Given /^there is a petition with Orkut share enabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:orkut_taf, :petition => petition)
  petition.publish
end

Given /^there is a petition with Twitter share enabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:twitter_taf, :petition => petition)
  petition.publish
end

Given /^there is a petition with e\-mail share enabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:email_taf, :petition => petition)
  petition.publish
end

Given /^there is a petition with all share options disabled$/ do
  petition = Factory.create(:petition)
  Factory.create(:autofire_email, :petition => petition)
  Factory.create(:taf, :petition => petition)
  petition.publish
end
