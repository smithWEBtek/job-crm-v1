class Action < ApplicationRecord
  belongs_to :contact
  belongs_to :job
  belongs_to :org
  belongs_to :step

  #scoped resource:category, based on action step chosen
  # http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
  
  # def self.jobsearch
  #   where(step_id: [2..8])  
  # end

  # def self.techprep
  #   where(step_id: [9..12])  
  # end

  # def self.branding
  #   where(step_id: [13..22])  
  # end


end
