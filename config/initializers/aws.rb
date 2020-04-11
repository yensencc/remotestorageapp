require 'aws-sdk'
Aws.config.update(
 
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
  :region => 'us-east-1'
)

S3_BUCKET = Aws::S3::Resource.new(
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],  ENV['AWS_SECRET_ACCESS_KEY']),
      region: 'us-east-1'
    )
    








