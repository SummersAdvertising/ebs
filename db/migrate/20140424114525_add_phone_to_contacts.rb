class AddPhoneToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :phone, :text
  end
end
