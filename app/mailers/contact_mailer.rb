# encoding: utf-8
class ContactMailer < ActionMailer::Base
  default from: "\"Ebs\" <adam@summers.com.tw>"
  
  def new_contact(contact)
  		@contact = contact
		mail( :to => Admin.where(isnotify: true).pluck( :email ), :subject => '收到了新的詢問！' ) do | format |
  			format.html { render 'new_contact' }
  		end
  end
end