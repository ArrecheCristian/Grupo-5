class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.integer :precioBase
      t.integer :residencia_id

      t.timestamps
    end
  end
end
