class TicketMailer < ApplicationMailer
	default from: 'dummy_acct@dummy_domain.com'

	def ticket_email(customer, sale)
		@customer = customer
		@sale = sale
		mail(to: @customer.email, subject: "Popcorn Cinema - Your Ticket")
	end
end
