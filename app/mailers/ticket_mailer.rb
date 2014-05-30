# encoding: utf-8
class TicketMailer < ActionMailer::Base
  default from: "adword@summers.com.tw"

  def sendTicket(contact)
      		@contact = contact
  		if !Admin.where(isnotify: true).pluck( :email ).empty?
  			Admin.where(isnotify: true).select(:email).each do | email | 
				mail( :to => email , :subject => '收到了新的詢問！' ) 
  			end
	  	else
	  		#if there is no one has been set  isnotify = true
# 			mail( :to => Admin.pluck( :email ), :subject => '收到了新的詢問！' ) do | format |
# 	  			format.html { render 'new_contact' }
# 	  		end
	  	end
  end
end
