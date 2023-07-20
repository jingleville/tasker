class ProfileController < ApplicationController
  before_action :authenticate_user!
  
  def index
    redirect_to  user_session_path if !current_user
  end
end
