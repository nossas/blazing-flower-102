Factory.define :user do |m|
  m.first_name 'Admin'
  m.last_name  'Test'
  m.password   '123-test'
  m.sequence(:email) {|n| "test-admin#{n}@meurio.org.br" }
end

Factory.define :admin, :parent => :user do |a|
  a.admin true
end

Factory.define :petition do |p|
  p.sequence(:title) {|n| "Test Petition #{n}" }
  p.sequence(:custom_path) {|n| "test-petition-#{n}" }
  p.call_to_action 'Assine'
  p.state 'draft'
end


Factory.define :autofire_email do |a|
  a.from SITE['default_from_email_address']
  a.sequence(:subject) {|n| "test-autofire-email-#{n}" }
  a.message "This is a test email"
end

Factory.define :petition_with_email, :parent => :petition do |p|
  p.association :autofire_email
end
