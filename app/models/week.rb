class Week < ApplicationRecord
	belongs_to :residence, required: false

 	validates :residence_id, presence: true
  	validates :fecha, uniqueness: {scope: :residence_id}
	
	default_scope->{order("fecha asc")}


	def send_mail
		WeekMailer.new_week(self).deliver_later
	end

	def send_mail_delete
		WeekMailer.delete_week(self).deliver_later
	end


end
