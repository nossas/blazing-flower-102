class Issue < ActiveRecord::Base
  validates_presence_of :name

  has_many :petitions
  has_many :debates
  has_many :personal_stories

  has_attached_file :image,
                    :path => ':attachment/:id/:style/:filename',
                    :storage => :s3,
                    :styles => { :large => "630x435" },
                    :bucket => SITE['s3_bucket'],
                    :s3_credentials => {
                      :access_key_id => SITE['s3_access_key_id'],
                      :secret_access_key => SITE['s3_secret_access_key']
                    }
end
