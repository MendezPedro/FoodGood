class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = User.find(params[:id])
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
        format.html { redirect_to root_path, notice: 'category destroy' }
      else
        format.html { redirect_to root_path, alert: 'alert url bookmarks not create' }
      end
    end
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
