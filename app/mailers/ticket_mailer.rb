class TicketMailer < ApplicationMailer
	default from: 'haha@chacha.com'

	def ticket_email(customer, sale)
		@customer = customer
		@sale = sale
		mail(to: @customer.email, subject: "Is this working?")
	end
end
