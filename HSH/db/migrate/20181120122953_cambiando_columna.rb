class CambiandoColumna < ActiveRecord::Migration[5.2]
  def change
    rename_column :auctions, :residencia_id, :residence_id
  end
end
