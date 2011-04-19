require  'spec_helper'

describe LocationsController do
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    @city         = Factory(:city)
    @trade_shows  = Factory(:trade_show, :city => @city)
    get :show, :id => @city.id
    #response.should render_template('/welcomes/trade_shows')
  end
end
