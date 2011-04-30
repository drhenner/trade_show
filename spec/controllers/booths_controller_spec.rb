require  'spec_helper'

describe BoothsController do
  render_views

  it "show action should render show template" do
    @booth = Factory(:booth)
    get :show, :id => @booth.id
    response.should render_template(:show)
  end
end
