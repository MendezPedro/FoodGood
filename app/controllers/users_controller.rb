class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(users_params)
        format.js { redirect_to root_path, notice: 'urlmark create' }
      else
        format.html { redirect_to root_path, alert: 'alert url bookmarks not create' }
      end
    end
  end

  private
  def users_params
    params.require(:user).permit(:name, :email)
  end
end
