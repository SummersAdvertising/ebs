class ReviewsController < ApplicationController
	def index
		#@review = Review.all.order( :ranking => :desc ,:created_at => :desc ).first #要加上 ranking排序
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
		#@reviews = Review.all.order( :ranking => :desc ,:created_at => :desc ).page( params[ :page ] ).per(5) #要加上 ranking排序
		@review = Review.find( params[ :id ] )
		
	end
	
end
