#encoding: utf-8
class Admin::ReviewsController < AdminController
 before_action :set_review, only: [:show, :edit, :update, :destroy,:upload_cover, :resize_cover]
  
  def index
    @review = Review.order( :ranking => :desc ,:created_at => :desc ).page(params[:page])
  end

  def show
  end

  def create
    @review = Review.new
    @review.article = Article.new    
    @review.title = "未命名標題"
    @review.save

    respond_to do |format|
        format.html { redirect_to edit_admin_review_path(@review), notice: '學生證言已建立.' }
        format.json { render action: 'show', status: :created, location: @review }
    end
  end

  def edit
  	  	#@STATUS = [['Active', '1'], ['In Active', '0']]
  	  	#@ADMINS = Admin.all
  end

  def update
    respond_to do |format|
      if @review.update(review_params) && ( params[ :article ].nil? ^ @review.article.update( params.require(:article).permit(:content) ) )
        format.html { redirect_to admin_review_path(@review), notice: '學生證言 was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
      	flash[ :warning ] = @review.errors.full_messages.join( '<br>' )
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_cover
    respond_to do |format|
      if @review.update(review_params)
        format.js
      end
    end
  end
  
  def resize_cover
    @path = "public#{@review.cover}"

    image = MiniMagick::Image.open( @path )
    image.crop "#{params[:width]}x#{params[:height]}+#{params[:x1]}+#{params[:y1]}"
    
    image.write @path
    
    respond_to do | format |
      format.js
    end
    
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to admin_reviews_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :cover, :content, :status, :name, :course, :ranking)
    end
    

end
