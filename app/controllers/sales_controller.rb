class SalesController < ApplicationController

	def index
		@sales = Sale.all
	end

	def new
		@showtime = Showtime.find_by(id: params[:showtime_id])
		if @showtime
			puts 'here'
			render "new"
		else
			redirect_to :root
		end 
	end

	def create
		@showtime = Showtime.find_by(id: params[:showtime_id])
		if @showtime
			@customer = Customer.new(customer_params)
			if @customer.save
				@sale = Sale.new()
				@sale.showtime = @showtime
				@sale.customer = @customer
				if @sale.save
					redirect_to @sale
				else
					@errors = @sale.errors.full_messages
					render "new"
				end
			else
				@errors = @customer.errors.full_messages
				render "new"
			end
		else
			@errors = ["Sorry, that showtime is not available."]
			render "new"
		end

	end

	def show
		@sale = Sale.find_by(id: params[:id])
		if @sale
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
			@success_message = "Success!"
			render "index"
		else
			@errors = @sale.errors.full_messages
			render "index"
		end
	end

	private
	def customer_params
    params.require(:customer).permit(:name, :email, :cc_number, :cc_expiration_date)
  end

end