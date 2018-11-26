class AgregarFotoPerfilUsers < ActiveRecord::Migration[5.2]
  
  def change
  	  	add_column :users, :Foto_perfil, :string
  	 	rename_column :users, :NumeroTarjeta, :Numero_tarjeta
  		rename_column :users, :VencimientoTarjeta, :Vencimiento_tarjeta
  end
end
