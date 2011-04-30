class Purchase::TradeShowAdsController < ApplicationController
  def new
    form_info
    @booth = Booth.new
  end

  def create
    @booth = Booth.new(params[:booth])
    if @booth.save
      flash[:notice] = "Successfully created trade show ad."
      redirect_to purchase_trade_show_ad_url(@booth)
    else
      form_info
      render :action => 'new'
    end
  end

  def show
    @booth = Booth.find(params[:id])
  end

  private

  def form_info
    @companies    = Company.all.map{|c| [c.name, c.id]}
    @trade_shows  = TradeShow.future.map{|ts| [ts.name, ts.id]}
  end
end
