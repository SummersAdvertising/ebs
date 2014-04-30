# encoding: utf-8

class ReviewsCoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  
  #process :resize_if_needed
  resize_and_pad(100, 100, "#05F250")
  # def resize_if_needed
#   	img = Magick::Image.read(self.file.path)
#   	@width = img[0].columns
#   	@height = img[0].rows
#   	if (@width.to_i < 100 or @height.to_i < 100)
#   	
# 	  	resize_and_pad(100, 100, "#05F250")
#   	end
#    end
  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
