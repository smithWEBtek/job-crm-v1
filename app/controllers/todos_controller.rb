class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
  def admin
    @todos = Todo.all # constrain this to admin only eventually
    render :admin
  end

  def index
    @company_todos = Todo.all.where(company_id: params[:company_id])
    @contact_todos = Todo.all.where(contact_id: params[:contact_id])
    @job_todos = Todo.all.where(job_id: params[:job_id])    
    @user_todos = current_user.todos
    @todos = Todo.all


    # render 'todos/index', layout: false
    # render :index, layout: false
    # render layout: false

    # render json: @user_todos

    # render 'todos/todos', locals: { todos: @user_todos }, layout: false
    # render 'todos/user_todos', locals: { todos: @user_todos }, layout: false
    # render json: { partial: 'todos/user_todos', locals: { todos: @user_todos }, layout: false }
    # render { partial: 'todos/user_todos', locals: { todos: @user_todos }, layout: false }
    # render 'todos/user_todos', locals: { todos: @user_todos }
    # render partial: 'todos/user_todos', layout: false  
  end
   
  def show
  end

  def new
    @user = current_user
    @todo = @user.todos.build(date: Time.now)
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:message] = 'Todo created.'
      # redirect_to user_todos_path(current_user)
      redirect_to user_path(current_user)
    else
      render 'todos/show'
    end
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    if @todo.save
      flash[:message] = 'Todo updated.'
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def destroy
    @todo.delete
    redirect_to user_todos_path(current_user)
  end

  private
  def set_todo
    @todo = Todo.find_by_id(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:user_id, :step_id, :job_id, :contact_id, :company_id, :date, :notes, :priority)
  end
end
