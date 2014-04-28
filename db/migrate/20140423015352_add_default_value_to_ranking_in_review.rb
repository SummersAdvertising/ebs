class AddDefaultValueToRankingInReview < ActiveRecord::Migration
  def change
  	    change_column :reviews, :ranking, :integer , :default => 0
  end
end
