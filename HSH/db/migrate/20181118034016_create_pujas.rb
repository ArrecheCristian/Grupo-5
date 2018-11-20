class CreatePujas < ActiveRecord::Migration[5.2]
  def change
    create_table :pujas do |t|
      t.integer :monto
      t.string :email

      t.timestamps
    end
  end
end
