class Puja < ApplicationRecord
  belongs_to :auction,required: false

  validates :precioBase_actual, presence: true
  validates :monto, presence: true, numericality: { greater_than: :precioBase_actual }
  validates :email, presence: true

  validates :auction_id, presence: true


  default_scope -> { order("created_at desc") }


end
