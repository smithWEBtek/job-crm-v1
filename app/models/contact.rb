class Contact < ApplicationRecord
  belongs_to :company
  has_many :actions
  # accepts_nested_attributes_for :org
end
