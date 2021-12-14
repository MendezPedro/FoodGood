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
        # para que la vista no haga nada
        #format.js { render layout: false, notice: 'lo re borraste' }
        format.html { redirect_to root_path, notice: 'Usuario eliminado' }
      else
        format.html { redirect_to root_path, alert: 'No se pudo eliminar' }
      end
    end
  end

  #este metodo facebook deberia ir en el controller de omniauth_callback
  # def facebook
  #   @user = User.find_for_facebook_oauth(
  #     request.env['omniauth.auth']
  #   )
  #   if @user.persisted?
  #     flash[:notice] = "has ingresado via facebook"
  #     sign_in_and_direct @user, :event => :authentication
  #   else
  #     redirect_to_new_user_registration_url
  #   end
  # end

  private
  def users_params
    params.require(:user).permit(:name, :email, :images)
  end
end
