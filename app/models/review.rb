class Review < ActiveRecord::Base
	
	mount_uploader :cover, ReviewsCoverUploader
	
	belongs_to :article, :dependent => :destroy
		
	validates_presence_of :title
	
	validates :ranking, :inclusion => 0..1
	
	paginates_per 25

end
