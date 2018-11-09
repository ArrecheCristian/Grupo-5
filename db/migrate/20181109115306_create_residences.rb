class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.string :title
      t.string :description
      t.string :address
      t.integer :stars

      t.timestamps
    end
  end
end
