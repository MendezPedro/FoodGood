class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @categories = Category.all
    @food_stores = FoodStore.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save 
        format.js { redirect_to root_path, notice: 'Publicacion creada' }
      else
        format.html { redirect_to root_path, alert: 'No se pudo crear la publicacion' }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
    @food_stores = FoodStore.all
  end
  
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(posts_params)
        format.js { redirect_to users_path, notice: 'Publicacion actualizada' }
      else
        format.html { redirect_to users_path, alert: 'No se puedo actualizar' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.destroy!
        format.js { redirect_to users_path, notice: 'publicacion eliminada' }
      else
        format.html { redirect_to users_path, alert: 'No se pudo eliminar' }
      end
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :content, :category_id, :food_store_id, :user_id, :rating, :rater_id)
  end
end