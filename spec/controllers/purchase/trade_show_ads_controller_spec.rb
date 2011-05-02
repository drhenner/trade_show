require  'spec_helper'

describe Purchase::TradeShowAdsController do
  render_views

  before(:each) do
    activate_authlogic

    company = Factory(:company)
    @user = Factory(:user, :company => company)
    login_as(@user)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Booth.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Booth.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(purchase_trade_show_ad_url(assigns[:booth]))
  end

  it "show action should render show template" do
    @booth = Factory(:booth)
    get :show, :id => @booth.id
    response.should render_template(:show)
  end
end
