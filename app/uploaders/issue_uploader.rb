# encoding: utf-8

class IssueUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def paperclip_path
    "/issues/:attachment/:id/:filename"
  end


  def default_url
    "http://placehold.it/100x75" 
  end

  version :thumbnail do
    process :resize_to_fill => [100,75]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
