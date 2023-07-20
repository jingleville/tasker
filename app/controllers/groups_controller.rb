class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    groups = Member.where("user_id=#{current_user.id}").pluck(:group_id)
    @groups = Group.find(groups)
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.members.all
    @tasks = @group.tasks.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save

      if @group.members.find_by(user_id: current_user.id)
        p "User is in the group"
      else
        @member = @group.members.new
        @member.user_id = current_user.id
        @member.role = "Admin"
        @member.save
      end




      redirect_to @group
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])

    @group.destroy

    redirect_to root_path
  end

  private
  def group_params
    params[:group][:author] = current_user.username
    params.require(:group).permit(:author, :title)
  end
end
