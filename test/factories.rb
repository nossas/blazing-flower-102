Factory.define :admin_user do |m|
  m.first_name 'Admin'
  m.last_name  'Test'
  m.password   '123-test'
  m.sequence(:email) {|n| "test-admin#{n}@meurio.org.br" }
end

Factory.define :admin, :parent => :admin_user do |a|
  a.is_admin true
end

Factory.define :deactivated, :parent => :admin_user do |a|
  a.active false
end

Factory.define :member do |m|
  m.sequence(:email) {|n| "test-email-#{n}@example.com" }
  m.name "Cukey Cucumber"
  m.zona "Centro"
end

Factory.define :petition do |p|
  p.sequence(:title) {|n| "Test Petition #{n}" }
  p.sequence(:custom_path) {|n| "test-petition-#{n}" }
  p.sequence(:call_to_action_text) {|n| "This test-petition-#{n} is really important." }
  p.sequence(:call_to_action_headline) {|n| "Sign this test-petition-#{n}!" }
  p.media "<img src='not/a/real/image.jpg'>"
  p.call_to_action 'Assine'
  p.state 'draft'
end

Factory.define :autofire_email do |a|
  a.from SITE['default_from_email_address']
  a.sequence(:subject) {|n| "test-autofire-email-#{n}" }
  a.message "This is a test email"
end

Factory.define :taf do |t|
  t.association :petition
  t.thank_you_headline 'Obrigado'
  t.thank_you_text "This is a test TAF"
end

Factory.define :petition_with_email, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
end

Factory.define :complete_petition, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:taf, :petition => p) }
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
end
