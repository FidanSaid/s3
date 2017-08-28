class Post < ApplicationRecord
	after_validation :generate_unique_key,   on:  :create
	mount_uploader :image, PhotoUploader
	mount_uploader :mirror_image, MirrorPhotoUploader


private
	def generate_unique_key
		self.unique_key = SecureRandom.hex(10)
	end

end

