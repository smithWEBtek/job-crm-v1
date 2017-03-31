class ActionsController < ApplicationController
  before_action :set_action, only: [:show, :edit, :update, :destroy]
  
  def index
    @company_actions = Action.all.where(company_id: params[:company_id])
    @contact_actions = Action.all.where(contact_id: params[:contact_id])
    @job_actions = Action.all.where(job_id: params[:job_id])    
    @user_actions = Action.all.where(user_id: params[:user_id])
    @admin_actions = Action.all
    # render json: @actions
  end
   
  def show
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(action_params)
    if @action.save
      flash[:message] = 'Action created.'
      redirect_to action_path(@action)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @action.update(action_params)
    if @action.save
      flash[:message] = 'Action updated.'
      redirect_to action_path(@action)
    else
      render :edit
    end
  end

  def destroy
    @action.destroy
    redirect_to root_path
  end

  private
  def set_action
    @action = Action.find_by_id(params[:id])
  end

  def action_params
    params.require(:action).permit(:step_id, :job_id, :contact_id, :org_id, :due_date, :notes, :status, :next_step, :first_contact)
  end
end
