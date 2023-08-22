class StagesController < ApplicationController
  before_action :authenticate_user!, :set_group, :set_procedure
	before_action :set_stage, only: %i[ show edit update destroy ]

	def new
		@stage = @procedure.stages.new
	end

	def create
    @stage = @procedure.stages.create(stage_params)
    if @stage.save
    	@stage.responsible_people.create(responsible_user_params)
      redirect_to group_procedures_path(@procedure.group.id)
    else
      render :new
    end
	end

	def edit
	end

	def update
	end

	def show
    @stage = Stage.find(params[:id])
    @responsible_people = @stage.responsible_people

	end

	def destroy
    @stage.destroy
    redirect_to group_procedures_path(@group.id)
	end

  private

  def set_group
  	@group = Group.find(params[:group_id])
  end

  def set_procedure
		@procedure = Procedure.find(params[:procedure_id])
  end

  def set_stage
  	@stage = Stage.find(params[:id])
  end

  def stage_params
  	@procedure = Procedure.find(params[:procedure_id])
  	@stages = @procedure.stages.where("title != 'Finished'")
  	params[:stage][:stage_ord] = (@stages.maximum(:stage_ord) ? @stages.maximum(:stage_ord) + 1 : 1)
  	params[:stage][:color] = params[:color]
    params.require(:stage).permit(:title, :color, :stage_ord)
  end

  def responsible_user_params
    params.require(:stage).permit(:user_id)
  end
end
