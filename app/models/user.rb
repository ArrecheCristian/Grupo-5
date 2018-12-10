class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true

  default_scope->{order("Nombre asc")}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
