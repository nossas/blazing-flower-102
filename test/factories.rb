#coding: utf-8
#
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
  m.first_name Faker::Name.first_name
  m.last_name Faker::Name.last_name
  m.zona "Centro"
end

Factory.define :petition do |p|
  p.sequence(:custom_path) {|n| "test-petition-#{n}" }
  p.media '<iframe width="560" height="349" src="http://www.youtube.com/embed/Z00jjc-WtZI" frameborder="0" allowfullscreen></iframe>'
  p.call_to_action_text "A sua participação é muito importante, contamos com a sua colaboração!"
  p.call_to_action_headline "Assine esta petição!"
  p.title Faker::Company.name
  p.description Faker::Lorem.paragraphs.join("\n")
  p.surface_comments true
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

Factory.define :facebook_taf, :parent => :taf do |t|
  t.facebook_title "Sharing on Facebook"
  t.facebook_link "test.com"
  t.facebook_message "Just testing..."
  t.display_facebook true
end

Factory.define :orkut_taf, :parent => :taf do |t|
  t.orkut_title "Sharing on Orkut"
  t.orkut_link "test.com"
  t.orkut_message "Just testing..."
  t.display_orkut true
end

Factory.define :twitter_taf, :parent => :taf do |t|
  t.twitter_url "test.com"
  t.tweet "Just testing..."
  t.display_twitter true
end

Factory.define :email_taf, :parent => :taf do |t|
  t.email_subject "Sharing via email"
  t.email_message "Testing...."
  t.display_email true
end

Factory.define :petition_with_email, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
end

Factory.define :complete_petition, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:taf, :petition => p) }
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
end

Factory.define :petition_signature do |p|
  p.association :petition
  p.association :member
end

Factory.define :provider_authorization do |p|
  p.association :member
  p.provider "provider"
  p.sequence(:uid){|n| n.to_s }
end
