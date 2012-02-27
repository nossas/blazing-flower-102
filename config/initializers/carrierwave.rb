if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
elsif Rails.env.production?
  begin
    CarrierWave.configure do |config|
      config.storage = :s3
      config.s3_access_key_id = ENV["S3_ID"]
      config.s3_secret_access_key = ENV["S3_SECRET"]
      config.s3_bucket = SITE['s3_bucket']
    end
  end
end
