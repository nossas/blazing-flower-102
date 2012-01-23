Given /^there is an issue$/ do
  @issue = Factory.create(:issue)
end

Given /^there is an issue with letters enabled$/ do
  @issue = Factory.create(:issue, :letters_enabled => true)
end

Given /^there is a petition called "([^"]*)"$/ do |arg1|
  @petition = Factory.create(:complete_petition, :title => arg1)
  @petition.publish
end

Given /^I already signed this petition$/ do
  Factory.create(:petition_signature, :member => Member.find_by_email("diogob@gmail.com"), :petition => @petition)
end

Given /^I have a friend called "([^"]*)"$/ do |arg1|
  Koala::Facebook::GraphAPI.any_instance.stub(:get_connections).with("me", "friends").and_return([{"name"=>"Alessandra Orofino", "id"=>"2630"}])
end
