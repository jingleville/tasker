class StagesController < ApplicationController
  before_action :authenticate_user!
	
	def index
		if params[:group_id]
			p params[:group_id]
			@group = Group.find(params[:group_id])
			@procedures = @group.procedures
		else
			@procedures = Procedure.all
		end
	end

	def new
		@group = Group.find(params[:group_id])
		@procedure = Procedure.find(params[:procedure_id])
		@stage = @procedure.stages.new
	end

	def create
		p stage_params
		@group = Group.find(params[:group_id])
		@procedure = Procedure.find(params[:procedure_id])
    @stage = @procedure.stages.create(stage_params)
    if @stage.save
    	@stage.responsible_people.create(responsible_user_params)
      redirect_to group_procedure_path(@procedure.group.id, @procedure)
    else
      render :new
    end
	end

	def edit
		
	end

	def update
		
	end

	def show
		@group = Group.find(params[:group_id])
    @procedure = Procedure.find(params[:procedure_id])
    @stage = Stage.find(params[:id])
    @responsible_people = @stage.responsible_people
	end

	def destroy

	end

  private
  def stage_params
  	@procedure = Procedure.find(params[:procedure_id])
  	@procedure.stages.maximum(:stage_ord) ? @procedure.stages.maximum(:stage_ord) + 1 : 1
  	params[:stage][:stage_ord] = (@procedure.stages.maximum(:stage_ord) ? @procedure.stages.maximum(:stage_ord) + 1 : 1)
  	params[:stage][:color] = params[:color]
    params.require(:stage).permit(:title, :body, :color, :stage_ord)
  end

  def responsible_user_params
    params.require(:stage).permit(:user_id)
  end
end
