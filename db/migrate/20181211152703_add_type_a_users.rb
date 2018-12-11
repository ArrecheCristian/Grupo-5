class AddTypeAUsers < ActiveRecord::Migration[5.2]
  
  def change
  	add_column :users, :numero_tarjeta, :string
  	add_column :users, :dni, :string
  end

end
