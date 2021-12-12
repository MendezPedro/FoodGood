class HomeController < ApplicationController
  def index
    @user = User.all
    @posts = Post.all.order(created_at: :desc)
    @category = Category.where(id:409).pluck("title")
    @comment = Comment.all
  end
end
