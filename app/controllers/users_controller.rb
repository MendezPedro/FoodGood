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

  # def omniauth
  #   @user = User.from_omniauth(auth)
  #   @user.save
  #   session[:user_id] = @user.id
  #   redirect_to home_path
  # end
  
  # private
  # def auth
  #   request.env['omniauth.auth']
  # end
  # def omniauth
  #   @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
  #     u.email = auth[:info][:email]
  #     u.username = auth[:info][:name]
  #     u.uid = auth[:uid]
  #     u.provider = auth[:provider]
  #     u.password = SecureRandom.hex(10)
  #   end
  #   if @user.valid?
    
  #     session[:user_id] = @user.id
  #     redirect_to root_path
  #   else
  #     flash[:message] = "error credential"
  #     redirect_to root_path
  #   end
  # end
  
  # private
  # def auth
  #   request.env['omniauth.auth']
  # end

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
