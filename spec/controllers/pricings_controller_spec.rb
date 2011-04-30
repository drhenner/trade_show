require  'spec_helper'

describe PricingsController do
  render_views

  it "show action should render show template" do
    @pricing = Factory(:pricing)
    get :show, :id => @pricing.id
    response.should render_template(:show)
  end
end
