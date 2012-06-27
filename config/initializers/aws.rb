if Rails.env.production?
  AWS::S3::Base.establish_connection!(
    :access_key_id     => ENV["S3_ID"],
    :secret_access_key => ENV["S3_SECRET"]
  )
end
