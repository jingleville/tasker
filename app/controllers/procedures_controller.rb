class ProceduresController < ApplicationController
  before_action :authenticate_user!
	before_action :set_group, only: %i[ index new create show ]
	before_action :set_procedure, only: %i[ show edit update destroy ]
	
	def index
		@procedures = @group.procedures
	end

	def new
		@procedure = Procedure.new
	end

	def create
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
	end

	def update
		@procedure.update(procedure_params)
		if @procedure.save
      redirect_to groups_path
		else
			render :edit
		end		
	end

	def show
    @stages = @procedure.stages
	end

	def destroy
    @procedure.destroy
    redirect_to groups_path
	end

  private
  def set_group
  	@group = Group.find(params[:group_id])
  end

  def set_procedure
		@procedure = Procedure.find(params[:id])
  end


  def procedure_params
    params.require(:procedure).permit(:title, :body)
  end

  def available_groups
    current_user_groups = Member.where("user_id=#{current_user.id}").pluck(:group_id)
    Group.find(current_user_groups)
  end
end
