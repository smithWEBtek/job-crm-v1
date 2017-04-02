class Todo < ApplicationRecord
  belongs_to :user  
  belongs_to :contact
  belongs_to :job
  belongs_to :company
  belongs_to :step
  has_many :todo_logs

  #scoped resource:category, based on todo step chosen
  # http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
  
  # def self.jobsearch
  #   where(step_id: [2..8])  
  # end

  # def self.techprep
  #   where(step_id: [9..12])  
  # end

  # def self.branding
  #   where(step_id: [13..22])  
  # end

  def log
    todo = Todo.find_by_id(self.id)
        # change to current_user.todos.build
        # when current_user method is working
    todo_log = TodoLog.create(
      todo_id: todo.id,
      log_date: Time.zone.now,
      step: todo.step.name,
      notes: todo.notes,
      priority: todo.priority
    )
    if todo_log.save
      flash[:message] = "Todo current values recorded to todo_log."
    else
      render 'users/:id/todos/:id/edit', message: "Todo not logged!"
    end
  end
end
