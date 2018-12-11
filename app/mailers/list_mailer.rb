class ListMailer < ApplicationMailer
	def new_auction(auction)
		@auction = auction

		p = List.where(fecha: @auction.fecha, residence_id: @auction.residence_id )
		p.each do |user|
			mail(to: user.email, subject: "La subasta que buscabas inició! Comienza a pujar!!"  )
		end

	end
end
