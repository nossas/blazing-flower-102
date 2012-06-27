class FeaturedContentWidget < Widget
  validates_presence_of :link
  validates_format_of :link, :with => URI::regexp(%w(http https))
  validates_presence_of :title
  
  mount_uploader :image, ImageUploader, :mount_on => :image_file_name

end
