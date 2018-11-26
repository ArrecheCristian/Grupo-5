class AgregarCamposAUsers < ActiveRecord::Migration[5.2]

  def change
  	rename_column :users, :Edad, :Nacimiento
  	rename_column :users, :NroTarjeta, :NumeroTarjeta
  	add_column :users, :VencimientoTarjeta, :integer
  	add_column :users, :Banco, :string
  end

end
