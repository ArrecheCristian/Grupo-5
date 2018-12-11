class ChangeTypeAUsers < ActiveRecord::Migration[5.2]
  
  def change
  	remove_column :users, :numero_tarjeta
  	remove_column :users, :dni
  end

end
