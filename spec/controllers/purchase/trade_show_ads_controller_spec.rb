require  'spec_helper'

describe Purchase::TradeShowAdsController do
  render_views

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    TradeShowAd.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    TradeShowAd.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(purchase_trade_show_ad_url(assigns[:trade_show_ad]))
  end
  
  it "show action should render show template" do
    @trade_show_ad = Factory(:trade_show_ad)
    get :show, :id => @trade_show_ad.id
    response.should render_template(:show)
  end
end
