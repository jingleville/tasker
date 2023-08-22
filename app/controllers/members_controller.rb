class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ index new create show ]
  before_action :set_member, only: %i[ show edit update destroy ]  
  
  def index
  end

  def new
  end

  def create
    if @group.members.find_by(user_id: params[:user_id])
      p "User is in the group"
    else
      @member = @group.members.create(member_params)
    end
    redirect_to groups_path
  end

  def edit
  end

  def update
  end


  def destroy
    user = @member.user.username
    @group = @member.group
    if @member.user == current_user
      redirect_to groups_path, alert: "You can not delete yourself"
    else
      @member.destroy
      redirect_to groups_path, notice: "#{user} deleted"
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_member
    @member = member.find(params[:id])
  end

  def member_params
    params[:member] = {
      user_id: params[:user_id],
      role:    params[:role]
    }
    params.require(:member).permit(:user_id, :role)
  end
end
