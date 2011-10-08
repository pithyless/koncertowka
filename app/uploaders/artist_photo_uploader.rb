# encoding: utf-8

class ArtistPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :square do
    process :resize_to_fill => [275, 275]
  end

  version :medium do
    process :resize_to_fit => [400, 400]
  end

  def extension_white_list
    %w(jpg jpeg)
  end

end
