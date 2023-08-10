class ProjectsController < ApplicationController
  before_action :authenticate_user!
	
	def index
		p params
		if params[:procedure_id]
			@procedures = Procedure.find(params[:procedure_id])
			@projects = @procedure.projects
		else
			p 'no procedure'
			@projects = Project.all
		end
	end

	def new
		@group = Group.find(params[:group_id])
		@procedure = Procedure.find(params[:procedure_id])
		@project = @procedure.projects.new
	end

	def create
		@group = Group.find(params[:group_id])
		@procedure = Procedure.find(params[:procedure_id])
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

	def next_stage
		@project = Project.find(params[:project_id])
		@procedure = @project.procedure

		@stage = @procedure.stages.where("stage_ord > ?", @project.stage.stage_ord).first
		@project.stage_id = @stage.id
		@project.save
		render json: @project
	end

	def prev_stage
		@project = Project.find(params[:project_id])
		@procedure = @project.procedure

		@stage = @procedure.stages.where("stage_ord < ?", @project.stage.stage_ord).last
		@project.stage_id = @stage.id
		@project.save
		render json: @project
	end

	def show
		@group = Group.find(params[:group_id])
  	@procedure = Procedure.find(params[:id])
  	@stages = @procedure.stages
	end

	def destroy

	end

  private
  def project_params
  	procedure = Procedure.find(params[:procedure_id])
  	params[:project][:stage_id] = procedure.stages.order(order: :asc)[0].id
    params.require(:project).permit(:title, :body, :stage_id)
  end
end

