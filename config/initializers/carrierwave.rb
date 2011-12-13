if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
elsif Rails.env.production?
  begin
    CarrierWave.configure do |config|
      access_key = SITE['s3_access_key_id']
      secret_key = SITE['s3_secret_access_key']
  #    fog_directory = Configuration.find_by_name('fog_directory')
      bucket = SITE['s3_bucket']

      if access_key and secret_key and bucket
        config.s3_access_key_id = access_key.value
        config.s3_secret_access_key = secret_key.value
        config.s3_bucket = bucket.value
      end
    end
  rescue
  end
end
