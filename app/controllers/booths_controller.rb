class BoothsController < ApplicationController
  def show
    @booth = Booth.includes([{:trade_show => { :booths => :company }}, { :company => :owners }]).find(params[:id])
    @trade_show = @booth.trade_show
    render :layout => "trade_show"
  end

  private

  def form_info

  end
end
