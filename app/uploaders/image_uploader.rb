# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::Compatibility::Paperclip
  include CarrierWave::MiniMagick

  def paperclip_path
    name = model.class.to_s.downcase

    if name == "featuredcontentwidget"
      "widgets/featured_content/:attachment/:id/:filename"
    elsif name == "issue"
      ":attachment/:id/:style/:filename"
    else
      "uploads/:id/:attachment/:style_:basename.:extension"
    end
  end

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end


  version :large do
    process :resize_to_fill => [630, 435]
  end

  def default_url
    "http://placehold.it/635x435"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
