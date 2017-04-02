class Contact < ApplicationRecord
  belongs_to :company
  has_many :todos

  def name
    "#{self.fname}" + " " + "#{self.lname}"
  end
end
