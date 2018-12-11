class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  validates :Nombre, presence: true
  validates :Apellido, presence: true
  validates :Nacimiento, presence: true
  validates :Numero_tarjeta, presence: true , length: { is: 16 }
  validates :Vencimiento_tarjeta, presence: true
  validates :Banco, presence: true
  validates :DNI, presence: true, length: { in: 8..13 }


  default_scope->{order("Nombre asc")}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
