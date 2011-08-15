class Widget < ActiveRecord::Base
  validates_presence_of :type
  validates_format_of :link, :with => URI::regexp(%w(http https))
end
