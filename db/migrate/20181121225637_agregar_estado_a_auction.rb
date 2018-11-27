class AgregarEstadoAAuction < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :estado, :string
  end
end
