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
        format.js { redirect_to root_path, notice: 'post create' }
      else
        format.html { redirect_to root_path, alert: 'alert post not create' }
      end
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :content, :category_id, :food_store_id, :user_id, :rating, :rater_id)
  end
end