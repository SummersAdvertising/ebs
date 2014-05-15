class AddConsultcourseToContact < ActiveRecord::Migration
  def change
  	  	add_column :contacts, :consultcourse, :text
  end
end
