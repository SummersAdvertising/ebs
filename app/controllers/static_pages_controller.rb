# encoding: utf-8
class StaticPagesController < ApplicationController
		before_action :set_options, only: [:index]
		
		#before_filter :check_for_mobile, only: [:index]
		# Always render mobile versions for these, regardless of User-Agent.
		#before_filter :prepare_for_mobile, only: [:index]
	def index
	
		@contact = Contact.new
		@reviews = Review.order( :ranking => :desc ,:created_at => :desc ).limit(3);
		respond_to do | format |
			format.html { }
			#format.html { render :template => 'views_mobile/application' }
			#format.html { render layout: nil }
		end
	end
	
	def show
		
		if params[ :page ].nil?
			redirect_to :index
		end
		
		respond_to do | format |
			format.html { render :template => 'static_pages/' + params[ :page ] rescue redirect_to '/errors' }
		end
		
	end

	private
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
			@bottleneck = [['工作太忙', '工作太忙'],['斷斷續續沒有整合', '斷斷續續沒有整合'],['不敢說', '不敢說'],['單字量不夠', '單字量不夠'],['發音不標準', '發音不標準'],['單字/句型/文法錯誤', '單字/句型/文法錯誤'],['程度無法提升', '程度無法提升'],['其他', '其他']] 
			#聯絡時間
			@availabletime = [['早10:00~11:30', '早10:00~11:30'],['中14:00-17:00', '中14:00-17:00'],['晚18:30-21:00', '晚18:30-21:00'],['隨時', '隨時']]
			#YES or NO question
			@yesorno = [['是',1],['否',0]]
			#isParent
			@isparent = [['本人',0],['家長代填',1]]
			

	end
end
