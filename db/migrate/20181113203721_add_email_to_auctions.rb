class AddEmailToAuctions < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :email, :string
  end
end
