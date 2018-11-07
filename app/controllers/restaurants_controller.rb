class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :chef, :show]
  def index
    @restaurants = Restaurant.all
  end

  def top
    @restaurants = Restaurant.where(stars: 5)
  end

  def chef
    @chef_name = @restaurant.chef
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @new_restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
