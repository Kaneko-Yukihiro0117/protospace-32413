class PrototypesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @prototypes = Prototype.all.order(id: "DESC")
  end
  def show
    @prototype = Prototype.find(params[:id])
  end

  def  new
    @prototype = Prototype.new
  end

  def edit
    @prototype = Prototype.find(params[:id])
      unless @prototype.user_id == current_user.id
        #ユーザーではない人にeditさせない処理
      end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
    unless @prototype.user_id == current_user.id
      #ユーザーではない人に削除させない処理
    end
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      @prototype = prototype.includes(:user)
      render :new
    end
  end
  
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)  
    redirect_to prototype_path
    else 
      render:edit
    end
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: "index" unless user_signed_in?
  end

end
