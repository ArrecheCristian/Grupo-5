class AgregarDniUsers < ActiveRecord::Migration[5.2]
  
  def change
  	add_column :users, :DNI, :integer
  end

end
