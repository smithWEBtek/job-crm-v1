class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
  def admin
    @todos = Todo.all # constrain this to admin only eventually
    render :admin
  end

	def index
		@user = User.find_by_id(params[:id])
    @company_todos = Todo.all.where(company_id: params[:company_id])
    @contact_todos = Todo.all.where(contact_id: params[:contact_id])
    @job_todos = Todo.all.where(job_id: params[:job_id])    
    @todos = current_user.todos
   
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

    # respond_to do |format|
    #   format.html { render 'index.html'}
    #   format.js { render 'index.js'}
    # end
    # render 'index.js', layout: false
  end
   
  def show
  end

  def new
    @user = current_user
    @todo = @user.todos.build(due_date: Time.now)
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      # flash[:notice] = 'Todo created by RAILS!'
      # redirect_to user_todos_path(current_user)
      # redirect_to user_path(current_user)
      # render 'todos/todo', layout: false
      render 'index.js', layout: false

    else
      render 'todos/show'
    end
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    if @todo.save
      flash[:notice] = 'Todo updated.'
      redirect_to user_todos_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    if @todo.delete
      flash[:notice] = 'Todo deleted.'
      redirect_to user_todos_path(current_user)
    else
      render user_todos_path(current_user)
    end
  end

  private
  def set_todo
    @todo = Todo.find_by_id(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:user_id, :step_id, :job_id, :contact_id, :company_id, :date, :notes, :priority)
  end
end
