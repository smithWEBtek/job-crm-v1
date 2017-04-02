class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :omniauthable, omniauth_providers: [:github]

  has_many :todos
  has_many :jobs, through: :todos
  has_many :contacts, through: :todos
  has_many :companies, through: :todos
  has_many :steps, through: :todos
  has_many :resources
  has_many :user_logs

  validates :email, presence: true, uniqueness: true

  # def log
  #   user = User.find_by_id(self.id)
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
end
