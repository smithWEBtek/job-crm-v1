class ToolsController < ApplicationController

# import companies from scraper
  def import_new_companies
    Scrape.new_companies
    redirect_to companies_path
  end

# truncate companies table, reset primary key index
  def trunc_reset
    Company.trunc_reset
    redirect_to companies_path
  end

  def new_scrape
    redirect_to 'scrapers/new'
  end

  def test
    render 'test'
  end
 
end
