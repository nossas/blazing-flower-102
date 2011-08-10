class FeaturedContentWidget < Widget
  validates_presence_of :link

  has_attached_file :image
end
