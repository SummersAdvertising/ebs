class AddIsnotifyToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :isnotify, :boolean
  end
end
