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

end
