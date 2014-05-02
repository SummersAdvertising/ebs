class ReviewsController < ApplicationController
	def index
		@review = Review.order( :ranking => :desc ,:created_at => :desc ).page(params[:page])
		respond_to do | format |
		format.html 
			if @review.nil?
				format.html {render :template => 'layouts/empty' }
			else
				format.html {}
			end
		end
	end

	def show
		@review = Review.find( params[ :id ] )
	end
	
end
