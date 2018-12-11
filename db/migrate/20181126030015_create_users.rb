class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :Nombre
      t.string :Apellido
      t.date :Edad
      t.integer :NroTarjeta

      t.timestamps
    end
  end
end
