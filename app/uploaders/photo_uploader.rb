require 'carrierwave/storage/fog'
class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

   def initialize(*)
    super
    self.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      region: ENV['region_primary']
    }
    self.fog_directory = ENV['fog_directory1']
  end

 # def scale(width, height)
 #  #   # do something
 #   end

  version :thumbnail do
   process :resize_to_fill => [20, 20]
  end

  version :profile_size do
   process :resize_to_fill => [300, 300]
  end

  def extension_white_list
   %w(jpg jpeg gif png pdf)
  end

 # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
