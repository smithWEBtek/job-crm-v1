class Job < ApplicationRecord
  has_many :todos
  has_many :contacts
  belongs_to :company

end
