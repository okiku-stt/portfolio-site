class CompaniesController < ApplicationController
  before_action :set_company ,only: [:edit,:update,:show,:destroy]
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    Company.create(company_params)
    redirect_to companies_path
  end

  def edit
  end

  def update
    @company.update(company_params)
  end

  def show
  end

  def destroy
    @company.destroy
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name,:number,:settlement)
  end
end
