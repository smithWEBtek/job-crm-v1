class Company < ApplicationRecord
  has_many :contacts
  has_many :jobs
end
