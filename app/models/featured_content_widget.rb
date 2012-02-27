class FeaturedContentWidget < Widget
  validates_presence_of :link
  validates_format_of :link, :with => URI::regexp(%w(http https))
  validates_presence_of :title

  has_attached_file :image,
                  :path => 'widgets/featured_content/:attachment/:id/:filename',
                  :storage => :s3,
                  :bucket => SITE['s3_bucket'],
                  :s3_credentials => {
                    :access_key_id => ENV["S3_ID"],
                    :secret_access_key => ENV["S3_SECRET"]
                  }
end
