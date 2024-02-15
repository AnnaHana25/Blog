class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumb do
    process resize_to_fit: [300, 300]
  end
end
