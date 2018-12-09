class Auction < ApplicationRecord
  belongs_to :residence, required: false
  has_many :pujas,dependent: :destroy

  after_create  :send_mail

  validates :residence_id, uniqueness: true
  validates :precioBase, presence: true
  validates :fecha, uniqueness: { scope: :residence_id}

private

	def send_mail
		ListMailer.new_auction(self).deliver_later
	end


end
