Given /^there is a member where 'Meu Rio is' slogan is "([^"]*)"$/ do |arg1|
  @member = Factory(:member, :meu_rio_is => arg1)
end

Given /^there is a member without 'Meu Rio is' slogan$/ do
  @member = Factory(:member, :meu_rio_is => nil)
end
