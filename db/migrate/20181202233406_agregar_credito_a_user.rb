class AgregarCreditoAUser < ActiveRecord::Migration[5.2]
 
  def change
  	add_column :users, :credito, :integer, { null: false, default: 2 }

  end

end
