class UsersController < ApplicationController
 
  def index
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy    
  end

  def update
    user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :occupation, :profile, :position)
end
