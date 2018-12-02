class CreateHotsales < ActiveRecord::Migration[5.2]
  def change
    create_table :hotsales do |t|
      t.integer :monto
      t.string :fecha
      t.string :estado
      t.string :email
      t.integer :residence_id

      t.timestamps
    end
  end
end
