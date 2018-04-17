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
  has_many :logs, through: :todos

  validates :email, presence: true, uniqueness: true
 
end
