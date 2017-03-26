class Job < ApplicationRecord
  has_many :actions
  has_many :contacts
  belongs_to :org
end
