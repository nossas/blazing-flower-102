# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  include CarrierWave::MiniMagick

  def paperclip_path
    name = model.class.to_s.downcase
    if    name == "adminuser" or name == "taf"
      ":attachment/:id/:style/:filename"
    elsif name == "member"
      "members/:id/:filename"
    elsif name == "imagewidget"
      "widgets/image/:attachment/:id/:filename"
    else
      "uploads/:id/:attachment/:style_:basename.:extension"      
    end
  end

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production? 
    storage :fog
  else
    storage :file
  end

  def default_url
    name = model.class.to_s.downcase
    if name == "member" or name == "adminuser"
      "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(model.email)}.jpg?s=260&d=http://#{SITE['site_url']}/assets/avatar_blank.png"
    else
     "http://placehold.it/250x180" 
    end
  end

  # Create different versions of your uploaded files:
  version :medium do
    process :resize_to_fill => [250, 200]
  end

  version :thumb, :from_version => :medium do
    process :resize_to_fill => [60, 60]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
