class FoodStoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @food_stores = FoodStore.all.order(created_at: :desc)
  end

  def new
    @food_store = FoodStore.new

  end

  def show
    @food_store = FoodStore.find(params[:id])
  end

  def create
    @food_store = FoodStore.new(food_stores_params)
    respond_to do |format|
      if @food_store.save 
        format.js { redirect_to food_stores_path, notice: 'Tienda creada' }
      else
        format.html { redirect_to food_stores_path, alert: 'No se pudo crear la Tienda' }
      end
    end
  end

  private
  def food_stores_params
    params.require(:food_store).permit(:name, :latitude, :longitude, :day_open, :schedule, photographics: [])
  end
end
