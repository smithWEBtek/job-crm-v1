class OrgsController < ApplicationController
  before_action :set_org, only: [:show, :edit, :update, :destroy]
  
  def index
    @orgs = Org.all.order(:name)
    # render json: @orgs
  end

  def show
  end

  def new
    @org = Org.new
  end

  def create
    @org = Org.new(org_params)
    if @org.save
      flash[:message] = 'Org created.'
      redirect_to org_path(@org)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @org.update(org_params)
    if @org.save
      flash[:message] = 'Org updated.'
      redirect_to org_path(@org)
    else
      render :edit
    end
  end

  def destroy
    @org.destroy
    redirect_to root_path
  end

  private
  def set_org
    @org = Org.find_by_id(params[:id])
  end

  def org_params
    params.require(:org).permit(:name, :city, :state, :url, :about)
  end
end
