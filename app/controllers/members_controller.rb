class MembersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
  end

  def create
    @group = Group.find(params[:group_id])
    if @group.members.find_by(user_id: member_params[:user_id])
      p "User is in the group"
    else
      p "creating user #{member_params}}"
      @member = @group.members.create(member_params)
    end
    redirect_to group_path(@group)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def member_params
    params.require(:member).permit(:user_id, :role)
  end
end


