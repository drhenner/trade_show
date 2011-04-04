require  'spec_helper'

describe Admin::Shows::CompaniesController do
  render_views

  before(:each) do
    activate_authlogic
    @user = Factory(:admin_user)
    login_as(@user)
    @trade_show = Factory(:trade_show)
  end

  it "index action should render index template" do
    get :index, :trade_show_id => @trade_show.id
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @company = Factory(:company)
    get :show, :id => @company.id, :trade_show_id => @trade_show.id
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, :trade_show_id => @trade_show.id
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Company.any_instance.stubs(:valid?).returns(false)
    post :create, :trade_show_id => @trade_show.id
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Company.any_instance.stubs(:valid?).returns(true)
    post :create, :trade_show_id => @trade_show.id
    response.should redirect_to(admin_shows_trade_show_company_url(@trade_show, assigns[:company]))
  end

  it "edit action should render edit template" do
    @company = Factory(:company)
    get :edit, :id => @company.id, :trade_show_id => @trade_show.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @company = Factory(:company)
    Company.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @company.id, :trade_show_id => @trade_show.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @company = Factory(:company)
    Company.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @company.id, :trade_show_id => @trade_show.id
    response.should redirect_to(admin_shows_trade_show_company_url(@trade_show, assigns[:company]))
  end

  it "destroy action should destroy model and redirect to index action" do
    @company = Factory(:company)
    delete :destroy, :id => @company.id, :trade_show_id => @trade_show.id
    response.should redirect_to(admin_shows_trade_show_companies_url(@trade_show))
    Company.exists?(@company.id).should be_false
  end
end
