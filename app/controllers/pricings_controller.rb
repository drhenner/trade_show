class PricingsController < ApplicationController
  def show
    @pricing = PurchasePlan.active
  end

  private

  def form_info

  end
end
