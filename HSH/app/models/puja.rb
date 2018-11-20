class Puja < ApplicationRecord
  belongs_to :auction,required: false
  validates :monto, presence: true
  validates :email, presence: true

  default_scope -> { order("created_at desc") }
end
