class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :complejo
      t.string :ubicacion
      t.string :semana
      t.string :temporada
      t.integer :capacidad
      t.string :descripcion
      t.integer :precio
      t.integer :estrellas
      t.string :imagen

      t.timestamps
    end
  end
end
