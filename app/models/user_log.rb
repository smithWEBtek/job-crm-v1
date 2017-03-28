class UserLog < ApplicationRecord
  belongs_to :user
  has_many :tags


  # def new
  #   @user_log = UserLog.new
  # end

  # def create
  #   @user_log = UserLog.create(user_log_params)
  #   if @user_log.save
  #     redirect_to 'user_path(@user_log.user)'
  #   else
  #     render 'logs/new'
  #   @user_log.user_id = params[:user_id]
  #   @user
  #       user = User.find_by_id(self.id)
  #       # change to current_user.users.build
  #       # when current_user method is working
  #   @user_log = user.user_logs.build(
  #     log_date: Time.zone.now,
  #     notes: user.notes
  #   )
  #   if user_log.save
  #     flash[:message] = "User log recorded to user_log."
  #   else
  #     render 'users/:id/users/:id/edit', message: "User log not logged!"
  #   end
  # end
  # private
  #   def user_log_params
  #     params.require(:user_log).permit(:user_id, :log_date, :notes)
  #   end
end
