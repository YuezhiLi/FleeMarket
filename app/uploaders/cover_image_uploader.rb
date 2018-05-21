class CoverImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
