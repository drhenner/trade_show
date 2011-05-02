require  'spec_helper'

describe Admin::Plans::FeaturesController do
  render_views

  before(:each) do
    activate_authlogic
    @user = Factory(:admin_user)
    login_as(@user)
    @ticket = Factory(:ticket)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @feature = Factory(:feature)
    get :show, :id => @feature.id
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Feature.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Feature.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_plans_feature_url(assigns[:feature]))
  end

  it "edit action should render edit template" do
    @feature = Factory(:feature)
    get :edit, :id => @feature.id
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    @feature = Factory(:feature)
    Feature.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @feature.id
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    @feature = Factory(:feature)
    Feature.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @feature.id
    response.should redirect_to(admin_plans_feature_url(assigns[:feature]))
  end

  it "destroy action should destroy model and redirect to index action" do
    @feature = Factory(:feature)
    delete :destroy, :id => @feature.id
    response.should redirect_to(admin_plans_features_url)
    feature = Feature.find(@feature.id)
    feature.id.should_not be_nil
    feature.active.should be_false
  end
end