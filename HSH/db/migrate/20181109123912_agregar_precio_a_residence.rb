class AgregarPrecioAResidence < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :precio, :integer
  end
end
