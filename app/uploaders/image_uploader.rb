# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # use GraphicsMagick to handle images
  MiniMagick.processor = :gm

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process resize_to_fill: [140, 140]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
