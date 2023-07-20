class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @groups_member = Member.where(user_id: current_user.id)
    @tasks = Task.all
  end

  def new
    @task = Task.new
    p params
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @task = @group.tasks.create(task_params)
    if @task.save
      redirect_to @group
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
  end


  private
  def task_params
    params[:task][:author] = current_user.username
    params.require(:task).permit(:author, :title, :body, :deadline, :status)
  end
end


