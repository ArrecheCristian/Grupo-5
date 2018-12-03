class CamposAMinusculaUserLists < ActiveRecord::Migration[5.2]
  
  def change
  	rename_column :users, :Nacimiento, :nacimiento
  	rename_column :users, :Numero_tarjeta, :numero_tarjeta
  	rename_column :users, :Vencimiento_tarjeta, :vencimiento_tarjeta
  	rename_column :users, :Banco, :banco
  	rename_column :users, :Foto_perfil, :foto_perfil
  	rename_column :users, :DNI, :dni
  end

end
