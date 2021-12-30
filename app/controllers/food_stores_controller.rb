class FoodStoresController < ApplicationController
  before_action :authenticate_user!

  def get_locations
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:latitude]},#{params[:longitude]}&radius=500&key=#{ENV['GOOGLE_PLACES_KEY']}"
    http_call = open(url).read
    response = JSON.parse(http_call, {:symbolize_names => true})
    @locations = response[:results]
  end
  

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
    @user = current_user
    respond_to do |format|
      if @food_store.save 
        # Tell the UserMailer to send a welcome email after save
        UserMailer.with(user: @user).welcome_email.deliver_now

        format.js { redirect_to root_path, notice: 'Tienda creada' }
      else
        format.html { redirect_to root_path, alert: 'No se pudo crear la Tienda' }
      end
    end
  end

  private
  def food_stores_params
    params.require(:food_store).permit(:name, :latitude, :products, :longitude, :day_open, :schedule, :closing, :address, photographics: [])
  end
end
