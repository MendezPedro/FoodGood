class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    #para ser graficados
    @yours_locals = Post.group(:user_id).count
    @yours_comments = Comment.group(:user_id).count
  end
  def graphic
    #para ser graficados
    @yours_locals = Post.group(:user_id).count
    @yours_comments = Comment.group(:user_id).count
  end

end

