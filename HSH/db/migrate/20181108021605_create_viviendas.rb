class CreateViviendas < ActiveRecord::Migration[5.2]
  def change
    create_table :viviendas do |t|
      t.integer :cod
      t.string :titulo
      t.string :descripcion
      t.integer :precio
      t.string :ubicacion
      t.integer :cant_personas
      t.integer :cant_estrellas

      t.timestamps
    end
  end
end
