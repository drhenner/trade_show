class BoothsController < ApplicationController
  def show
    @booth = Booth.find(params[:id])
  end

  private

  def form_info

  end
end
