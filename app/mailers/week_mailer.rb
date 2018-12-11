class WeekMailer < ApplicationMailer
	def new_week(week)
		@week = week

		mail(to: @week.estado, subject: "Gracias por reservar en nuestro sistema!")
	end

	def delete_week(week)
		@week = week

		mail(to: @week.estado, subject: "Hemos eliminado su reserva con éxito.")
	end
end
