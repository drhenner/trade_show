class Admin::Shows::TradeShowsController < Admin::Shows::BaseController
  def index
    @trade_shows = TradeShow.all
  end

  def show
    @trade_show = TradeShow.find(params[:id])
  end

  def new
    form_info
    @trade_show = TradeShow.new
  end

  def create
    @trade_show = TradeShow.new(params[:trade_show])
    if @trade_show.save
      flash[:notice] = "Successfully created trade show."
      redirect_to admin_shows_trade_show_url(@trade_show)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @trade_show = TradeShow.find(params[:id])
  end

  def update
    @trade_show = TradeShow.find(params[:id])
    if @trade_show.update_attributes(params[:trade_show])
      flash[:notice] = "Successfully updated trade show."
      redirect_to admin_shows_trade_show_url(@trade_show)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @trade_show = TradeShow.find(params[:id])
    @trade_show.destroy
    flash[:notice] = "Successfully destroyed trade show."
    redirect_to admin_shows_trade_shows_url
  end

  private

  def form_info
    @cities = City.all.collect{|c| [c.name, c.id]}
  end
end
