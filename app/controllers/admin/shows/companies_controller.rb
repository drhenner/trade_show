class Admin::Shows::CompaniesController < Admin::Shows::BaseController
  before_filter :trade_show
  def index
    @companies = trade_show.companies
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    form_info
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = "Successfully created company."
      redirect_to admin_shows_trade_show_company_url(trade_show, @company)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      flash[:notice] = "Successfully updated company."
      redirect_to admin_shows_trade_show_company_url(trade_show, @company)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Successfully destroyed company."
    redirect_to admin_shows_trade_show_companies_url(trade_show)
  end

  private

  def trade_show
    @trade_show ||= TradeShow.find(params[:trade_show_id])
  end

  def form_info

  end
end
