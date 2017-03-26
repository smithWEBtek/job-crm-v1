class User < ApplicationRecord
  has_many :actions
  has_many :jobs, through: :actions
  has_many :contacts, through: :actions
  has_many :orgs, through: :actions
  has_many :steps, through: :actions
  has_many :resources
end
