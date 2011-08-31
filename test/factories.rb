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
  m.first_name {Faker::Name.first_name}
  m.last_name {Faker::Name.last_name}
  m.zona "Centro"
  m.after_create { |p| p.update_attributes :image_url => "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(p.email)}.jpg?s=60&d=identicon" }
end

Factory.define :issue do |i|
  i.sequence(:name) { |n| "test-issue-#{n}" }
  i.description {Faker::Lorem.paragraphs.join("\n")}
  i.image_file_name 'missing.png'
  i.thumbnail_file_name 'missing.png'
  i.excerpt { Faker::Lorem.sentences }
end

Factory.define :petition do |p|
  p.sequence(:custom_path) {|n| "test-petition-#{n}" }
  p.media '<iframe width="560" height="349" src="http://www.youtube.com/embed/Z00jjc-WtZI" frameborder="0" allowfullscreen></iframe>'
  p.call_to_action_text "A sua participação é muito importante, contamos com a sua colaboração!"
  p.call_to_action_headline "Assine esta petição!"
  p.title {Faker::Company.name}
  p.headline {Faker::Lorem.sentence}
  p.description {Faker::Lorem.paragraphs.join("\n")}
  p.short_description {Faker::Lorem.paragraph}
  p.surface_comments true
  p.display_comment_field true
  p.comment_question "Comentário"
  p.call_to_action 'Assine'
  p.state 'draft'
  p.association :issue
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

Factory.define :copy_url_taf, :parent => :taf do |t|
  t.display_copy_url true
end

Factory.define :complete_taf, :parent => :taf do |t|
  t.facebook_title "Sharing on Facebook"
  t.facebook_link "test.com"
  t.facebook_message "Just testing..."
  t.display_facebook true
  t.orkut_title "Sharing on Orkut"
  t.orkut_link "test.com"
  t.orkut_message "Just testing..."
  t.display_orkut true
  t.twitter_url "test.com"
  t.tweet "Just testing..."
  t.display_twitter true
  t.email_subject "Sharing via email"
  t.email_message "Testing...."
  t.display_email true
  t.display_copy_url true
end

Factory.define :petition_with_email, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
end

Factory.define :complete_petition, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:complete_taf, :petition => p) }
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
end

Factory.define :petition_with_donation_enabled, :parent => :petition do |p|
  p.after_create { |p| Factory.create(:autofire_email, :petition => p) }
  p.display_donation true
  p.donation_thanks_message 'donation thanks'
  p.donation_headline 'donation help'
  p.donation_text 'donation text'
end

Factory.define :petition_signature do |p|
  p.petition { Factory(:complete_petition).tap{|p| p.publish } }
  p.association :member
  p.comment "Great success!!"
end

Factory.define :provider_authorization do |p|
  p.association :member
  p.provider "provider"
  p.sequence(:uid){|n| n.to_s }
end

Factory.define :petition_signature_with_comment, :parent => :petition_signature do |p|
  p.comment {Faker::Lorem.paragraph}
  p.comment_accepted true
end

Factory.define :debate do |d|
  d.question {Faker::Lorem.sentence(20) + "?"}
  d.author_1 { Factory(:member) }
  d.author_2 { Factory(:member) }
  d.association :issue
  d.title {Faker::Company.name}
  d.comment_prompt {"What do you have to say?"}
  d.author_title_side_1 "Lieutentent"
  d.author_title_side_2 "Admiral"
  d.author_organization_side_1 {Faker::Company.name}
  d.author_organization_side_2 {Faker::Company.name}
  d.quote_side_1 {Faker::Lorem.paragraph}
  d.quote_side_2 {Faker::Lorem.paragraph}
  d.text_side_1 {Faker::Lorem.paragraphs.join("\n")}
  d.text_side_2 {Faker::Lorem.paragraphs.join("\n")}
end

Factory.define :comment do |c|
  c.member { Factory(:provider_authorization).member }
  c.content { Faker::Lorem.paragraph}
  c.sequence(:created_at) {|n| Time.now - n.hours }
end

Factory.define :debate_comment, :parent => :comment do |d|
  d.commentable { Factory(:debate) }
end

Factory.define :comment_awaiting_moderation, :parent => :debate_comment do |c|
  c.after_create { |c| Comment::MODERATION_THRESHOLD.times{ Factory(:comment_flag, :comment => c) } }
end

Factory.define :moderated_comment, :parent => :comment_awaiting_moderation do |c|
  c.comment_accepted true
end

Factory.define :comment_flag do |d|
  d.comment { Factory(:debate_comment) }
  d.member { Factory(:member) }
end

Factory.define :personal_story do |s|
  s.sequence(:title){|n| "Personal Story #{n}" }
  s.description { Faker::Lorem.paragraph }
  s.excerpt { Faker::Lorem.paragraph }
  s.video_url "http://vimeo.com/26570444"
  s.connected_action "PETITION"

  s.association :issue
end

Factory.define :job do |j|
  j.sequence(:title) { |n| "Job Title #{n}" }
  j.description "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sed odio dui.</p>"
end

Factory.define :featured_content_widget do |w|
  w.title 'Featured Content Widget'
  w.link 'http://www.meurio.org.br'
  w.image_file_name 'testing.png'
end
