Factory.define :user do |m|
  m.first_name 'Admin'
  m.last_name  'Test'
  m.password   '123-test'
  m.sequence(:email) {|n| "test-admin#{n}@meurio.org.br" }
end

Factory.define :petition do |p|
  p.sequence(:title) {|n| "Test Petition #{n}" }
  p.sequence(:custom_path) {|n| "test-petition-#{n}" }
  p.call_to_action 'Assine'
  p.state 'draft'
end

