class WelcomesController < ApplicationController

  layout 'locator'

  def show
    cookies[:trade_show]  = params[:trade_show] if params[:trade_show].present?
    cookies[:location]    = params[:location]   if params[:location].present?

    if !params[:bipass_trade_show] && cookies[:trade_show] # Display the trade show
      @trade_show = TradeShow.includes({ :booths => :company }).find(cookies[:trade_show] )
      render :template => '/welcomes/trade_show', :layout => "trade_show"
    elsif !params[:bipass_location] && cookies[:location] # Display all trade shows at this location
      @city         = City.find(cookies[:location])
      @trade_shows  = TradeShow.where(["trade_shows.city_id = ? AND active = ?", cookies[:location], true])
      if @trade_shows.size == 1
        flash[:notice] = "Sorry there are no other trade shows available at this #{@city.name}" if params[:bipass_trade_show]
        @trade_show = @trade_shows.first
        cookies[:trade_show] = @trade_show.id
        render :template => '/welcomes/trade_show'
      else
        render :template => '/welcomes/trade_shows'
      end
    else # Display all locations
      @cities = City.order('cities.name DESC')
      render :template => '/welcomes/locations'
    end

  end
end
