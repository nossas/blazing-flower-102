Given /^(\d+) issue exist$/ do |count|
  @issue ||= []
  count.to_i.times do |f|
    f = Factory.create(:issue)
    @issue << f
  end
end

And /^(\d+) ideas exists for that issue$/ do |count|
  @idea ||= []
  count.to_i.times do |f|
    f = Factory.create(:idea, :issue => @issue.first)
  end
end
