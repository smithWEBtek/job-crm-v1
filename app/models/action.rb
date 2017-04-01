class Action < ApplicationRecord
  belongs_to :user  
  belongs_to :contact
  belongs_to :job
  belongs_to :company
  belongs_to :step
  has_many :action_logs

  #scoped resource:category, based on action step chosen
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
    action = Action.find_by_id(self.id)
        # change to current_user.actions.build
        # when current_user method is working
    action_log = ActionLog.create(
      action_id: action.id,
      log_date: Time.zone.now,
      step: action.step.name,
      notes: action.notes,
      status: action.status,
      next_step: action.next_step
    )
    if action_log.save
      flash[:message] = "Action current values recorded to action_log."
    else
      render 'users/:id/actions/:id/edit', message: "Action not logged!"
    end
  end
end
