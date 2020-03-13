class SchedulesController < ApplicationController
  before_action :set_company
  before_action :set_schedule,only: [:edit,:update,:show,:destroy]
  def index
    @schedules = Schedule.where(company_id: params[:company_id]).order(:settle_year).order(:settle_month)

  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(tax_params)
    if @schedule.save
      redirect_to company_schedules_path(@company)
    else
      flash.now[:notice] = "エラーが発生しました。もう一度入力してください。"
      render :new
    end
  end

  def edit
  end

  def update
    @schedule.update(tax_params)
  end

  def destroy
    @schedule.destroy
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def tax_params
    params.require(:schedule).permit(:settle_year,:settle_month,:company_tax,:consumption_tax).merge(company_id: @company.id)
  end
end
