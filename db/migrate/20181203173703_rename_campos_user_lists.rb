class RenameCamposUserLists < ActiveRecord::Migration[5.2]
  
  def change
  	rename_column :users, :Nombre, :nombre
  	rename_column :users, :Apellido, :apellido
  end

end
