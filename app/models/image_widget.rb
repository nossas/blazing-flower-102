class ImageWidget < Widget
  validates_presence_of :image

  has_attached_file :image,
                  :path => 'widgets/image/:attachment/:id/:filename',
                  :storage => :s3,
                  :bucket => SITE['s3_bucket'],
                  :s3_credentials => {
                    :access_key_id => ENV["S3_ID"],
                    :secret_access_key => ENV["S3_SECRET"]
                  },
                  :styles => { :thumb => "50x50", :medium => "200x200" }
end
