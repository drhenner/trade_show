class ProductsController < ApplicationController

  def index
    products      = Product.includes(:variants)
    product_type  = ProductType.find_by_id(params[:product_type_id])
    product_types = product_type ? product_type.self_and_descendants.collect{|p| p.id} : nil
    products      = products.where('(deleted_at IS NULL OR deleted_at < ?) AND (available_at > ? OR available_at IS NULL)', Time.zone.now, Time.zone.now)
    @products     = products.where('product_type_id IN (?)', product_types || featured_product_types)
  end

  def create

    pagination_args = {}
    pagination_args[:page] = params[:page] || 1
    pagination_args[:rows] = params[:rows] || 15

    if params[:q] && params[:q].present?
      @products = Product.standard_search(params[:q], pagination_args).results
    else
      @products = Product.where('deleted_at IS NULL OR deleted_at > ?', Time.zone.now )
    end

    render :template => '/products/index'
  end

  def show
    @product = Product.find(params[:id])
    form_info
  end

  private

  def left_tabs
    @product_types     ||= ProductType.all
    @left_tabs  ||= @product_types.map do |c|
      {:name => c.name, :params => {:product_type_id => c.id}, :color => nil }
    end
  end

  def tab_path(args)
    products_path(args)
  end

  def form_info
    @cart_item = CartItem.new
  end

  def featured_product_types
    [ProductType::FEATURED_TYPE_ID]
  end
end
