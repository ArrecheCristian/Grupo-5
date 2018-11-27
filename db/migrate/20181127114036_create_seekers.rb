class CreateSeekers < ActiveRecord::Migration[5.2]
  def change
    create_table :seekers do |t|

      t.timestamps
    end
  end
end
