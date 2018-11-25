class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :Nombre
      t.string :Apellido
      t.integer :Edad
      t.integer :N_Tarjeta

      t.timestamps
    end
  end
end
