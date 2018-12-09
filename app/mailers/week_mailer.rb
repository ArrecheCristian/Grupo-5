class WeekMailer < ApplicationMailer
	def new_week(week)
		@week = week

		mail(to: @week.estado, subject: "Gracias por reservar con nosotros")
	end

	def delete_week(week)
		@week = week

		mail(to: @week.estado, subject: "Hemos eliminado su reserva con exito")
	end
end
