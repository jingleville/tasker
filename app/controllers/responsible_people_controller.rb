class ResponsiblePeopleController < ApplicationController
	def new
		@stage = Stage.find(params[:id])
		@responsible_person = @stage.responsible_people.new
	end

	def create
		@stage = Stage.find(params[:id])
		@responsible_person = @stage.responsible_people.new(rp_params)
		if @responsible_person.save
			redirect_to all_procedures_path
		else
			render 'stages/show'
		end
    
	end

	private
	def rp_params
		params.require(:responsible_person).permit(:user_id)
	end
end