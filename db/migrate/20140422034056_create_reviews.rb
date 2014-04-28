class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :cover
      t.string :name
      t.string :course
      t.integer :ranking
      t.integer :article_id

      t.timestamps
    end
  end
end
