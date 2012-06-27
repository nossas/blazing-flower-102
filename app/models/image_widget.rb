class ImageWidget < Widget
  validates_presence_of :image

  mount_uploader :image, AvatarUploader, :mount_on => :image_file_name
end
