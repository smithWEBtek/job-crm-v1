class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  
  def index
    @resources = Resource.all
    # render json: @resources
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:message] = 'Resource created.'
      redirect_to resource_path(@resource)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @resource.update(resource_params)
    if @resource.save
      flash[:message] = 'Resource updated.'
      redirect_to resource_path(@resource)
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to root_path
  end

  private
  def set_resource
    @resource = Resource.find_by_id(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:name, :format, :location, :description, :tags)
  end
end
