class TicketMailer < ApplicationMailer
	default from: 'dummy_acct@dummy_domain.com'

	def ticket_email(customer)
		@customer = customer
		mail(to: @customer.email, subject: "Popcorn Cinema - Your Ticket")
	end
end
