class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = all_groups
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
        p 'creating a user'
        @member = @group.members.new
        @member.user_id = current_user.id
        @member.role = "admin"
        @member.save
      end

      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def archive
    @group = Group.find(params[:group_id])
    @group.archived ? @group.archived = false : @group.archived = true
    @group.save
    redirect_to root_path
  end

  def destroy
    @group = Group.find(params[:id])

    @group.archived = true

    redirect_to root_path
  end

  private
  def group_params
    p params
    params[:group][:author] = current_user.username
    params.require(:group).permit(:author, :title)
  end

  def all_groups
    current_user_groups = Member.where("user_id=#{current_user.id}").pluck(:group_id)
    Group.find(current_user_groups)
  end

  def available_groups
    current_user_groups = Member.where("user_id=#{current_user.id}").pluck(:group_id)
    groups = Group.find(current_user_groups).map {|group| group unless group.archived}
    groups.compact
  end

  def archived_groups
    current_user_groups = Member.where("user_id=#{current_user.id}").pluck(:group_id)
    groups = Group.find(current_user_groups).map {|group| group if group.archived}
    groups.compact
  end
end
