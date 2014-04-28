class Admin::ContactsController < AdminController
	  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.order( "updated_at DESC" ).page( params[ :page ] )
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:isparent,:name,:birthday,:address,:email,:education,:majorin,:learningtype,:institute,:period,:certification,:certificationdetail,:level,:score,:purpose,:purposedetail,:weekness,:bottleneck,:availabletime,:tpclass)

    end


end
