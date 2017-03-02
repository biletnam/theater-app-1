class SalesController < ApplicationController

	def index
		@sales = Sale.all
	end

	def new
		@sale = Sale.find_by(id: params[:id])
		if @sale
			render "show"
		else
			redirect_to :sales
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


end