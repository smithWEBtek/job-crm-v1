class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  
  def index
    @steps = Step.all.order(:id)
    # render json: @steps
  end

  def show
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      flash[:message] = 'Step created.'
      redirect_to step_path(@step)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @step.update(step_params)
    if @step.save
      flash[:message] = 'Step updated.'
      redirect_to step_path(@step)
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to root_path
  end

  private
  def set_step
    @step = Step.find_by_id(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :category)
  end
end
