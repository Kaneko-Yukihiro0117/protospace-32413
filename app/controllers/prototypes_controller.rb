class PrototypesController < ApplicationController

  def index
  end

  def  new
    @prototype = Prototype.new
  end

  def edit

  end

  def create
    Prototype.create(prototype.params)
    if @prototype.save
      redirect_to root_path(@room)
    else
      render :new
    end
  end
  
  
  private
  def prototype.params
    params.require(:prototype).permit(:title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

end
