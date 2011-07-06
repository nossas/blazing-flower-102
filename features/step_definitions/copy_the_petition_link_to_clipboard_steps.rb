Given /^there is a petition with display copy link enabled$/ do
  Factory.create(:complete_petition).tap{|p| p.publish; p.taf.update_attributes :display_copy_url => true }
end

Given /^there is a petition with display copy link disabled$/ do
  Factory.create(:complete_petition).tap{|p| p.publish}
end
