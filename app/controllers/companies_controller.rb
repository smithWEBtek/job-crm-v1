class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
    @companies = Company.all.order(:name)
    # render json: @companies
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:message] = 'Company created.'
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @company.update(company_params)
    if @company.save
      flash[:message] = 'Company updated.'
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path
  end

  private
  def set_company
    @company = Company.find_by_id(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city, :state, :url, :about)
  end
end
