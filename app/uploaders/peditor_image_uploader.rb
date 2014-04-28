# encoding: utf-8

class PeditorImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  
 def store_dir
    "uploads/#{model.article_id}"
  end

  def filename
    model.id ? "#{model.id}-#{original_filename}" : original_filename
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end
