class SalesController < ApplicationController

	def index
		@sales = Sale.all
	end

	def new
		@showtime = Showtime.find_by(id: params[:showtime_id])
		if @showtime && @showtime.is_available?
			render "new"
		else
			redirect_to :root
		end 
	end

	def create
		@showtime = Showtime.find_by(id: params[:showtime_id])
		if @showtime
			if @showtime.is_available?
				@customer = Customer.new(customer_params)
				if @customer.save
					@sale = Sale.new(confirmation_no: generate_confirmation_no)
					@sale.showtime = @showtime
					@sale.customer = @customer
					if @sale.save
						TicketMailer.ticket_email(@customer, @sale).deliver_now
						redirect_to @sale
					else
						# since sale can't be made
						@customer.destroy
						@errors = @sale.errors.full_messages
						render "new"
					end
				else
					# since customer validations failed
					@errors = @customer.errors.full_messages
					render "new"
				end
			else
				# since no available capacity in the auditorium
				@errors = ["Sorry, but this showtime is sold out."]
				@movie = @showtime.movie
				render "movies/show"
			end
		else
			# since the showtime is unavailable 
			redirect_to :root
		end
	end

	def show
		@sale = Sale.find_by(id: params[:id])
		if @sale
			@showtime = @sale.showtime
			render "show"
		else
			@errors = @sale.errors.full_messages
			render "index"
		end 
	end

	def destroy
		@sale = Sale.find_by(id: params[:id])
		if @sale
			@sale.destroy
			redirect_to :sales
		else
			redirect_to :root
		end
	end

	private
	def customer_params
    params.require(:customer).permit(:name, :email, :email_confirmation, :cc_number, :cc_expiration_month, :cc_expiration_year)
  end

  def generate_confirmation_no
		confirmation_no = ""
		loop do
			confirmation_no = rand(100000..999999).to_s
			break unless Sale.where(confirmation_no: confirmation_no).any?
		end
		confirmation_no
  end

end