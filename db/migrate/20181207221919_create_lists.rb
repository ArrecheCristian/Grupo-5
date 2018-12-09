class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :email
      t.string :fecha
      t.integer :residence_id

      t.timestamps
    end
  end
end
