class Doc < ApplicationRecord
  belongs_to :resource
# this code is cobbled together from the Pdf model, needs rework and validation for Word docs
  # def open_doc
  #   File.open(".lib/assets/resources/docs/resume.pdf", "rb") do |io|
  #     reader = PDF::Reader.new(io)
  #     puts reader.info
  #   end
  # end

  # def import_docs
  #   # magic ruby code that adds a doc(s) to the assets/docs folder 
  #   # using the 'new' form, and the 'file_field' form helper
  #   # and it can also pull from Dropbox, yeah its pretty sweet
  # end

  # def self.add_docs_to_db
  #   @docs = Dir.glob("lib/assets/resources/docs/*.*")
  #   @docs.map! do |doc|
  #     doc_name = doc.gsub("assets/resources/docs/", '')
  #     new_doc = Doc.find_or_create_by(name: doc_name, format: doc_name.reverse[0..2].reverse)
  #   end
  # end
end
