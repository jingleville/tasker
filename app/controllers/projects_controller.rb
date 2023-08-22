class ProjectsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_procedure, only: %i[ index new create edit update show destroy ]
	before_action :set_project, only: %i[ show edit update destroy ]
	
	def index
		@projects = @procedure.projects
	end

	def new
		@project = @procedure.projects.new
	end

	def create
    @project = @procedure.projects.create(project_params)
    if @project.save
      redirect_to group_procedure_path(@procedure.group.id, @procedure)
    else
      render :new
    end
	end

	def edit
		
	end

	def update
		
	end

	def update_stage
		@project = Project.find(params[:project_id])
		new_stage_id = params[:new_stage]
		old_stage_id = params[:old_stage]
		@project.stage_id = params[:new_stage]
			@project.save
		render json: @project
	end

	def show
  	@stages = @procedure.stages
	end

	def destroy

	end

  private

  def set_procedure
		@procedure = Procedure.find(params[:procedure_id])
  end

  def set_project
  	@project = Project.find(params[:id])
  end

  def project_params
  	procedure = Procedure.find(params[:procedure_id])
  	params[:project][:stage_id] = procedure.stages.order(order: :asc)[0].id
  	params[:project][:position] = (procedure.projects.maximum(:position) ? procedure.projects.maximum(:position) + 1 : 1)
    params.require(:project).permit(:title, :stage_id, :position)
  end
end

