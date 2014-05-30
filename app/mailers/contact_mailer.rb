# encoding: utf-8
class ContactMailer < ActionMailer::Base
  default from: "\"Ebs\" <adword@summers.com.tw>"
  
  def new_contact(contact)
  		@contact = contact
  		if !Admin.where(isnotify: true).pluck( :email ).empty?
			mail( :to => Admin.where(isnotify: true).pluck( :email ), :subject => '收到了新的詢問！' ) do | format |
	  			format.html { render 'contact_mailer/new_contact' }
	  		end
	  	end
  end
end