class AdminController < ApplicationController
	
	before_filter :authenticate_admin!
	
	after_action :clear_flash
	
private
	def clear_flash
		flash.delete(:warning)
	end

end
