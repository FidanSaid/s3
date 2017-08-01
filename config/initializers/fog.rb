require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region: ENV['region_primary'],
    region: ENV['region_secondary'],
    path_style: true

  }
  config.fog_directory = ENV['fog_directory1']
  config.fog_directory = ENV['fog_directory2']
  config.fog_attributes = {'x-amz-server-side-encryption' => 'AES256','Cache-Control'=>'max-age=315576000'}
end
