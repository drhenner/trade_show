require  'spec_helper'

describe Admin::Shows::TradeShowTypesController do
  render_views

  before(:each) do
    activate_authlogic
    @user = Factory(:admin_user)
    login_as(@user)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @trade_show_type = Factory(:trade_show_type)
    get :show, :id => @trade_show_type.id
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    TradeShowType.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    TradeShowType.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_shows_trade_show_type_url(assigns[:trade_show_type]))
  end

  it "edit action should render edit template" do
    @trade_show_type = Factory(:trade_show_type)
    get :edit, :id => @trade_show_type.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @trade_show_type = Factory(:trade_show_type)
    TradeShowType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @trade_show_type.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @trade_show_type = Factory(:trade_show_type)
    TradeShowType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @trade_show_type.id
    response.should redirect_to(admin_shows_trade_show_type_url(assigns[:trade_show_type]))
  end

  it "destroy action should destroy model and redirect to index action" do
    @trade_show_type = Factory(:trade_show_type)
    delete :destroy, :id => @trade_show_type.id
    response.should redirect_to(admin_shows_trade_show_types_url)
    TradeShowType.exists?(@trade_show_type.id).should be_false
  end
end
