# encoding: utf-8
class Contact < ActiveRecord::Base
		serialize :purpose, Array
		serialize :weekness, Array
		serialize :bottleneck, Array
		serialize :availabletime, Array

		#validates_presence_of :isparent, :message => "資料填寫人不能為空白"
		validates_presence_of :name, :message => "姓名不能為空白"
		validates_presence_of :birthday, :message => "生日 需選擇"
		validates_presence_of :purpose, :message => "學習英文的目的 需選擇"
		validates_presence_of :weekness, :message => "最想加強英文 需選擇"
		validates_presence_of :bottleneck, :message => "目前學英文的瓶頸 需選擇"
		validates_presence_of :availabletime, :message => "聯絡時間 需選擇"
		#validates_presence_of :tpclass, :message => "是否願意到台北上課 需選擇"
		validates :email, :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, :message => 'E-Mail 格式不符'  }, :allow_blank => true
		validates_presence_of :phone, :message => "請輸入電話或行動電話"
		validates :phone, :format => { :with => /\(?([0-9]{3})\)?([ #-]?)([0-9]{3})\2([0-9]{4})/, :message => '聯絡電話 格式不符' }
		
		paginates_per 25
end
