class WelcomeController < ApplicationController

  layout 'welcome'

  def index
    cookies[:trade_show]  = params[:trade_show] if params[:trade_show].present?
    cookies[:location]    = params[:location]   if params[:location].present?

    if cookies[:trade_show] # Display the trade show
      @trade_show = TradeShow.where(["trade_shows.id = ?", cookies[:trade_show] ])
      render :template => '/welcome/trade_show'
    elsif cookies[:location] # Display all trade shows at this location
      @trade_shows = TradeShow.where(["trade_shows.city_id = ? AND active = ?", cookies[:location], true])
      render :template => '/welcome/trade_shows'
    else # Display all locations
      @cities = City.order('cities.name DESC')
      render :template => '/welcome/locations'
    end

  end
end
