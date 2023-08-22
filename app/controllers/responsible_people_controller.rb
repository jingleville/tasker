class ResponsiblePeopleController < ApplicationController
	before_action :set_stage
	def new
		@responsible_person = @stage.responsible_people.new
	end

	def create
		@responsible_person = @stage.responsible_people.new(rp_params)
		if @responsible_person.save
			redirect_to all_procedures_path
		else
			render 'stages/show'
		end
	end

	private

	def set_stage
		@stage = Stage.find(params[:id])
	end

	def rp_params
		params.require(:responsible_person).permit(:user_id)
	end
end