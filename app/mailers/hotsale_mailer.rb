class HotsaleMailer < ApplicationMailer
	def new_hotsale(hotsale)
		@hotsale = hotsale

		mail(to: @hotsale.email, subject: "Gracias por reservar con nosotros!")
	end

	def delete_hotsale(hotsale)
		@hotsale = hotsale

		mail(to: @hotsale.email, subject: "Hemos eliminado su reserva con exito")
	end
end
