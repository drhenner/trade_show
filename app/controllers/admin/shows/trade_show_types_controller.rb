class Admin::Shows::TradeShowTypesController < Admin::Shows::BaseController

  def index
    @trade_show_types = TradeShowType.all
  end

  def show
    @trade_show_type = TradeShowType.find(params[:id])
  end

  def new
    form_info
    @trade_show_type = TradeShowType.new
  end

  def create
    @trade_show_type = TradeShowType.new(params[:trade_show_type])
    if @trade_show_type.save
      flash[:notice] = "Successfully created trade show type."
      redirect_to admin_shows_trade_show_type_url(@trade_show_type)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @trade_show_type = TradeShowType.find(params[:id])
  end

  def update
    @trade_show_type = TradeShowType.find(params[:id])
    if @trade_show_type.update_attributes(params[:trade_show_type])
      flash[:notice] = "Successfully updated trade show type."
      redirect_to admin_shows_trade_show_type_url(@trade_show_type)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @trade_show_type = TradeShowType.find(params[:id])
    @trade_show_type.destroy
    flash[:notice] = "Successfully destroyed trade show type."
    redirect_to admin_shows_trade_show_types_url
  end

  private

  def form_info

  end
end
