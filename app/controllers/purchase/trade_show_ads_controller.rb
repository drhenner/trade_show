class Purchase::TradeShowAdsController < ApplicationController
  before_filter :redirect_if_logged_out

  def new
    form_info
    @booth = Booth.new
  end

  def create
    @booth = Booth.new(params[:booth])
    if @booth.save
      flash[:notice] = "Successfully built Booth."
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
    if current_user.admin?
      @companies    = Company.all.map{|c| [c.name, c.id]}
    else
      @companies    =  [current_user.company.name, current_user.company.id]
    end
    @trade_shows  = TradeShow.future.map{|ts| [ts.name, ts.id]}
  end
end
