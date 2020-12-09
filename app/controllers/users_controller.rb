class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end
  
  def show
    @user = User.find(params[:id])
    @prototypes =  @user.prototypes
  end

  

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def ensure_correct_user
    if @current_user.id !=  params[:id].to_i
     redirect_to("/posts/index")
    end
  end

end
