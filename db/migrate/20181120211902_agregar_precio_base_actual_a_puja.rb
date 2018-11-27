class AgregarPrecioBaseActualAPuja < ActiveRecord::Migration[5.2]
  def change
    add_column :pujas, :precioBase_actual, :integer
  end
end
