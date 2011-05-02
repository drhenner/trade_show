class Admin::Plans::FeaturesController < Admin::Plans::BaseController
  def index
    @features = Feature.all
  end

  def show
    @feature = Feature.find(params[:id])
  end

  def new
    form_info
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(params[:feature])
    if @feature.save
      flash[:notice] = "Successfully created feature."
      redirect_to admin_plans_feature_url(@feature)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    form_info
    @feature = Feature.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])
    if @feature.update_attributes(params[:feature])
      flash[:notice] = "Successfully updated feature."
      redirect_to admin_plans_feature_url(@feature)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.update_attribute(:active, false)
    flash[:notice] = "Successfully destroyed feature."
    redirect_to admin_plans_features_url
  end

  private

  def form_info

  end
end
