class FeaturedContentWidget < Widget
  validates_presence_of :link
  validates_presence_of :title

  has_attached_file :image,
                  :path => 'widgets/featured_content/:attachment/:id/:filename',
                  :storage => :s3,
                  :bucket => SITE['s3_bucket'],
                  :s3_credentials => {
                    :access_key_id => SITE['s3_access_key_id'],
                    :secret_access_key => SITE['s3_secret_access_key']
                  }
end
