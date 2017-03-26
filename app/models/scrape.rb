class Scrape < ApplicationRecord
    belongs_to :resource

#   def self.new_orgs(url_scrape = 'https://clutch.co/developers/ruby-rails')
#     page = HTTParty.get(url_scrape)
#     @parse_page = Nokogiri::HTML(page)
#     devcos = []
#     orgs = @parse_page.css('.org-name a')

#     orgs.each_with_index do |org, i|
#       org_name = org.text
#       url = @parse_page.css('.website-link a')[i]['href']
#       org = {
#         name: org_name.strip,
#         url: url
#       }
#       devcos.push(org)
#     end
#     Org.import(devcos)
#     if !@parse_page.css('.pager-next a').empty?
#       url_next 
#     else
#     end
#   end

#   def self.url_next
#     @url_prefix = 'https://clutch.co/'
#     @url_suffix = @parse_page.css('.pager-next a')[0]['href']
#     new_orgs(@url_prefix + @url_suffix)
#   end
# end



  # def city_state_country_phone(devcos)
  #   devcos_detailed = []
  #   devcos.each do |org|
  #     url = "https://clutch.co/profile/" + org.name
  #     page = HTTParty.get(url)
  #     doc = Nokogiri::HTML(page)
  #   end
  # end

 
#     org = {
#       city:  doc.css('span.locality')[i].text,
#       state: doc.css('span.region')[i].text,
#       country: doc.css('span.country-name')[i].text,
#       phone: doc.css('')
#       }
#     devcos_detailed.push(org)
#     end
#       Org.import(org)
#     if !@doc.css('.pager-next a').empty?
#       url_next
#     else
#     end
end
 
