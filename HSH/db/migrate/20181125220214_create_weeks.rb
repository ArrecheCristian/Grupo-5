class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.string :estado
      t.string :fecha
      t.integer :residence_id

      t.timestamps
    end
  end
end
