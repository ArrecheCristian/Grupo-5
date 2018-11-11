class CreateHomeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :home_users do |t|

      t.timestamps
    end
  end
end
