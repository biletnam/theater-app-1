class AuditoriaController < ApplicationController

	def index
		@auditoria = Auditorium.all
	end

	def new
		@auditorium = Auditorium.new
		render "new"
	end

	def create
		@auditorium = Auditorium.new(auditorium_params)
		if @auditorium.save
			redirect_to :auditoria
		else
			@errors = @auditorium.errors.full_messages
			render "new"
		end
	end

	def edit
		@auditorium = Auditorium.find_by(id: params[:id])
		if @auditorium
			render "edit"
		else
			redirect_to :auditoria
		end
	end

	def update
		@auditorium = Auditorium.find_by(id: params[:id])
		if @auditorium
			if @auditorium.update_attributes(auditorium_params)
				redirect_to :auditoria
			else
				@errors = @auditorium.errors.full_messages
				render "edit"
			end
		else
			redirect_to :showtimes
		end
	end

	def destroy
		@auditorium = Auditorium.find_by(id: params[:id])
		if @auditorium
			@auditorium.destroy
			redirect_to :auditoria
		else
			redirect_to :root
		end		
	end

	def auditorium_params
    params.require(:auditorium).permit(:name, :capacity)
  end

end
