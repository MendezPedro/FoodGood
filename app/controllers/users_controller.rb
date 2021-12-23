class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index,  :edit, :create, :update, :destroy]
  
  def index
    @user = User.all
    @posts = Post.where(user_id:current_user.id)
    @category = Category.where(id:409).pluck("title")
  end

  def show
    
  end

  def graphic
    
  end
  

  def edit
    @user = User.find(params[:id])
    @posts = Post.all
    @post = Post.last
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(users_params)
        format.js { redirect_to users_path, notice: 'datos actualizados' }
      else
        format.html { redirect_to root_path, alert: 'no se pudo actualizar el usuario' }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.destroy!
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver_later

        # para que la vista no haga nada
        #format.js { render layout: false, notice: 'lo re borraste' }
        format.html { redirect_to root_path, notice: 'Usuario eliminado' }
      else
        format.html { redirect_to root_path, alert: 'No se pudo eliminar' }
      end
    end
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :images)
  end
end
