class AgregarAuctionIdAPujas < ActiveRecord::Migration[5.2]
  def change
    add_column :pujas, :auction_id, :integer
  end
end
