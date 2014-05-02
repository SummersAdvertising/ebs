# encoding: utf-8
class ContactsController < ApplicationController
	
	before_action :set_contact, only: [:show, :edit, :update, :destroy]  
	before_action :set_options, only: [:new,:create]
	
	def index
		    @contacts = Contact.order( "updated_at DESC" )
	end
	
	def show
	end
	
	def new
			@contact = Contact.new
	end
	
	def create

		    @contact = Contact.new(contact_params)
			@reviews = Review.order( :ranking => :desc ,:created_at => :desc ).limit(3);
			
		    respond_to do |format|
		      if @contact.save
		      	#TicketMailer.delay.send_notice( @ticket )
		      	#ContactMailer.new_contact( @contact ).deliver
		      	ContactMailer.delay.new_contact( @contact )
		      	
		        format.html { redirect_to root_url, notice: '感謝您的聯絡，請等候服務專員聯絡！' }
		        format.json { render action: 'show', status: :created, location: @contact }
		      else

		        flash[ :warning ] = @contact.errors.messages.values.flatten.join('<br />')
		        format.html { render template: 'static_pages/index'}
		        format.json { render json: @contact.errors, status: :unprocessable_entity }
        
		      end
		    end
	end
	
	def destroy
	
	end
	
private
	
	def set_contact
		@contact = Contact.find(params[:id])
	end
	
	def contact_params
params.require(:contact).permit(:isparent,:name,:birthday,:address,:email,:education,:majorin,:learningtype,:institute,:period,:certification,:certificationdetail,:level,:score,:purposedetail,{:weekness => []},{:bottleneck => []},{:availabletime => []},:tpclass,{:purpose => []},:phone )#,{:purpose => []} 
	end
	
	def set_options
			#[ value-text ] pairs
			#教育程度
			@education = [['博士', '博士'], ['碩士', '碩士'], ['大專院校', '大專院校'], ['高中職', '高中職'], ['國中', '國中'], ['國小', '國小'], ['幼稚園', '幼稚園']]
			#從前的英語學習管道
			@learningtype = [['學校英文課', '學校英文課'],['班級式補教機構', '班級式補教機構'],['自學', '自學'],['個人家教', '個人家教'],['線上英文補習班', '線上英文補習班']]
			#是否有英語證照
			@certification = [['多益', '多益'],['托福', '托福'],['雅思', '雅思'],['全民英檢', '全民英檢'],['其他', '其他'],['無', '']]
			#學英文的目的
			@purpose = [['考試', '考試'],['旅遊', '旅遊'],['工作用', '工作用'],['單純學習', '單純學習'],['移民', '移民'],['其他', '其他']]
			#最想加強英文
			@weekness = [['聽', '聽'],['說', '說'],['讀', '讀'],['寫', '寫'],['文法', '文法']]
			#瓶頸
			@bottleneck = [['斷斷續續沒有整合', '斷斷續續沒有整合'],['不敢說', '不敢說'],['單字量不夠', '單字量不夠'],['發音不標準', '發音不標準'],['單字/句型/文法錯誤', '單字/句型/文法錯誤'],['程度無法提升', '程度無法提升'],['其他', '其他']] 
			#聯絡時間
			@availabletime = [['早 10:00~11:30', '早 10:00~11:30'],['中 14:00-17:00', '中 14:00-17:00'],['晚 18:30-21:00', '晚 18:30-21:00'],['隨時', '隨時']]
			#YES or NO question
			@yesorno = [['是',1],['否',0]]
			#isParent
			@isparent = [['本人',0],['家長代填',1]]
	end
end
