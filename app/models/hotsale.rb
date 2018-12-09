class Hotsale < ApplicationRecord
	belongs_to :residence, required: false

	validates :residence_id, presence: true
  	validates :fecha, uniqueness: {scope: :residence_id}
  	validates :estado, presence: true

	default_scope->{order("fecha asc")}

	def send_mail
		HotsaleMailer.new_hotsale(self).deliver_later
	end

	def send_mail_delete
		HotsaleMailer.delete_hotsale(self).deliver_later
	end
end
