class LogsController < ApplicationController


  def action_logs
    @logs = ActionLog.all
  end

  def user_logs
    @logs = UserLog.all
  end
end