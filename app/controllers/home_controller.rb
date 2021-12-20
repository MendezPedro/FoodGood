class HomeController < ApplicationController
  def index
    @user = User.all
    if params[:q].present?
      @food_stores = FoodStore.where('name LIKE ?', "%#{params[:q]}%").order(created_at: :desc)
    else
      @food_stores = FoodStore.all.order(created_at: :desc)
    end
    @category = Category.where(id:409).pluck("title")
    #@food_store = FoodStore.find(params[:id])
  end
end
