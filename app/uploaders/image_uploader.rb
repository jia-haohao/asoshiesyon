class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def auto
  #   manipulate! do|image|
  #     image.auto_orient
  #   end
  # end

  # process :auto

  # version :thumb do
  #   process :resize_to_fill => [width, height, gravity = ::Magick::CenterGravity]
  # end

end
