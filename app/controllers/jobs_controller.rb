class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  
  def index
    @jobs = Job.all
    # render json: @jobs
  end

  def show
    @job_todos = Todo.all.where(job_id: params[:job_id])    
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:message] = 'Job created.'
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:message] = 'Job updated.'
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private
  def set_job
    @job = Job.find_by_id(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :url, :company_id, :description, :requirements, :instructions)
  end
end
