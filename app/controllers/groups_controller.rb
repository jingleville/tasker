class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ show edit update destroy ]  

  def index
    @groups = all_groups
  end

  def show
    @members = @group.members.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @member = @group.members.new
      @member.user_id = current_user.id
      @member.role = "Admin"
      @member.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def archive
    @group = Group.find(params[:group_id])
    @group.archived ? @group.archived = false : @group.archived = true
    @group.save
    redirect_to groups_path
  end

  def destroy
    @group.archived = true

    redirect_to groups_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
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
