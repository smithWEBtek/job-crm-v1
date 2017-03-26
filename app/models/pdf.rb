require 'pdf/reader'
require 'open-uri'

class Pdf < ApplicationRecord
  belongs_to :resource

  # def self.read_pdf
  #   file = File.open(self, "rb")
  #   PDF::Reader.open(self) do |reader|
  #     reader.pages.each do |page|
  #       puts page.text
  #     end
  #   end 
  # end

  # def self.open_pdf
  #   File.open("./assets/pdfs/verano.pdf", "rb") do |io|
  #     reader = PDF::Reader.new(io)
  #     puts reader.info
  #   end
  # end

  # def import_pdfs
  #   # magic ruby code that adds a pdf to the app/assets/pdfs folder 
  #   # using the 'new' form, and the 'file_field' form helper
  # end

  # def self.add_pdfs
  #   @pdfs = Dir.glob("app/assets/pdfs/*.pdf")
  #   @pdfs.map! do |pdf|
  #     pdf_name = pdf.gsub("app/assets/pdfs/", '')
  #     new_pdf = Pdf.find_or_create_by(name: pdf_name)
  #   end
  # end
end
