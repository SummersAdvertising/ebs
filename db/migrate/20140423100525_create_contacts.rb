class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.boolean :isparent
      t.string :name
      t.date :birthday
      t.string :address
      t.string :email
      t.string :education
      t.string :majorin
      t.string :learningtype
      t.string :institute
      t.string :period
      t.string :certification
      t.string :certificationdetail
      t.string :level
      t.integer :score
      t.string :purpose
      t.text :purposedetail
      t.string :weekness
      t.string :bottleneck
      t.string :availabletime
      t.boolean :tpclass
      
      t.timestamps
    end
  end
end
