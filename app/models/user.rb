class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :nacimiento, presence: true
  validates :numero_tarjeta, presence: true, numericality: true, length: { is: 16 } 
  validates :vencimiento_tarjeta, presence: true
  validates :banco, presence: true
  validates :dni, presence: true, numericality: true, length: { in: 7..13 }


  default_scope->{order("nombre asc")}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
