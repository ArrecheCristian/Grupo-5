class CreateCancellations < ActiveRecord::Migration[5.2]
  def change
    create_table :cancellations do |t|
      t.string :complejo
      t.string :descripcion
      t.string :fecha
      t.string :usuario
      t.string :motivo

      t.timestamps
    end
  end
end
