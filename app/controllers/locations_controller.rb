class LocationsController < ApplicationController
  layout 'locator'

  def index
    @locations = City.order('cities.name DESC').all
  end

  def show
    @city               = City.find(params[:id])
    cookies[:location]  = @city.id
    @trade_shows        = TradeShow.where(["trade_shows.city_id = ? AND active = ?", @city.id, true])
    render :template => '/welcomes/trade_shows'
  end

  private

  def form_info

  end
end
