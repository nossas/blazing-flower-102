CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS', 
    :aws_access_key_id      => ENV['S3_ID'],
    :aws_secret_access_key  => ENV['S3_SECRET'],
  }
  config.fog_directory  = SITE['s3_bucket']
end
