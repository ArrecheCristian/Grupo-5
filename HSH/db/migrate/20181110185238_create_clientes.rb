class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :complejo
      t.string :localidad
      t.string :semana
      t.string :temporada
      t.integer :capacidad
      t.string :descripcion
      t.integer :precio

      t.timestamps
    end
  end
end
