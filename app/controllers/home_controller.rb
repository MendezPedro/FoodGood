class HomeController < ApplicationController
  def index
    @user = User.all
    @posts = Post.all
    @category = Category.where(id:409).pluck("title")
  end
end
