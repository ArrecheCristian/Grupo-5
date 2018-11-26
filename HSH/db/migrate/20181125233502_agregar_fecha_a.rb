class AgregarFechaA < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :fecha, :string
  end
end
