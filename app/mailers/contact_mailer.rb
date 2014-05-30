# encoding: utf-8
class ContactMailer < ActionMailer::Base
  default from: "<adword@summers.com.tw>"
  
  def new_contact(contact)
  		@contact = contact
  		if !Admin.where(isnotify: true).pluck( :email ).empty?
			mail( :to => Admin.where(isnotify: true).pluck( :email ), :subject => '收到了新的詢問！' ) 
	  	else
	  		#if there is no one has been set  isnotify = true
# 			mail( :to => Admin.pluck( :email ), :subject => '收到了新的詢問！' ) do | format |
# 	  			format.html { render 'new_contact' }
# 	  		end
	  	end
  end
end