class UsersController < ApplicationController
  # before_action :authorize_admin, only: [:destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]
  # before_action :load_models

  def index
    @users = User.all
  end

  def show
    @actions = current_user.actions
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.username.upcase}! you have successfully signed up, please SIGN IN."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    @user_log = UserLog.new
  end

  def update
    @user.update_without_password(user_params)
    if @user.save
      flash[:notice] = 'User Account updated.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.delete
      flash[:notice] = 'User deleted'
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password,
      logs_attributes: [:user_id, :date, :note],
    meals_attributes: [:user_id, :mealdate, :mealname_id, :food_id, :new_food, :qty, :note])
  end
end
