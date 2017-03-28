class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :omniauthable, omniauth_providers: [:github]

  has_many :actions
  has_many :jobs, through: :actions
  has_many :contacts, through: :actions
  has_many :companies, through: :actions
  has_many :steps, through: :actions
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
