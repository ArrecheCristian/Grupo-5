class AgregarPersonAResidence < ActiveRecord::Migration[5.2]
  def change
    add_column :residences, :person, :integer
  end
end
