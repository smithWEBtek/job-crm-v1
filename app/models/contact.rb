class Contact < ApplicationRecord
  belongs_to :company
  has_many :actions
  # accepts_nested_attributes_for :org

  def name
    "#{self.fname}" + " " + "#{self.lname}"
  end
end
