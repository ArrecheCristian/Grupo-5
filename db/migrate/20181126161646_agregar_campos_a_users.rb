class AgregarCamposAUsers < ActiveRecord::Migration[5.2]

  def change
  	rename_column :users, :Edad, :Nacimiento
  	rename_column :users, :NroTarjeta, :NumeroTarjeta
  	add_column :users, :VencimientoTarjeta, :date
  	add_column :users, :Banco, :string
  end

end
