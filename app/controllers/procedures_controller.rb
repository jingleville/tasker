class ProceduresController < ApplicationController
  before_action :authenticate_user!
	
	def index
		if params[:group_id]
			@group = Group.find(params[:group_id])
			@procedures = @group.procedures
		else
			@procedures = Procedure.all
		end
	end

	def new
		@procedure = Procedure.new
    @group = Group.find(params[:group_id])
	end

	def create
		@group = Group.find(params[:group_id])
    @procedure = @group.procedures.create(procedure_params)
    if @procedure.save
    	@stage = @procedure.stages.new
    	@stage.title = "Finished"
    	@stage.color = "#00008B"
    	@stage.stage_ord = 10000
    	@stage.save
      redirect_to groups_path(anchor: "#{@group.id}-#{@procedure.id}")
    else
      render :new
    end
	end

	def edit
		@procedure = Procedure.find(params[:id])
	end

	def update
		@procedure = Procedure.find(params[:id])
		@procedure.update(procedure_params)
		if @procedure.save
      redirect_to groups_path
		else
			render :edit
		end		
	end

	def show
		@group = Group.find(params[:group_id])
    @procedure = Procedure.find(params[:id])
    @stages = @procedure.stages
	end

	def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
	end

  private
  def procedure_params
    params.require(:procedure).permit(:title, :body)
  end

end
