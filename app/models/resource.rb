class Resource < ApplicationRecord
  belongs_to :user
  has_many :tags

  # methods to import new list, and truncate/reset table id
  # def self.import(list)
  #   list.each do |org|
  #     new_org = Org.find_or_create_by(name: org[:name], url: org[:url])
      
  #     new_org.save
  #   end
  # end

  # def self.trunc_reset
  #   Org.destroy_all
  #   ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'companies'")
  # end


end
