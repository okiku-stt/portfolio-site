class FutureTaxesController < ApplicationController
  before_action :set_company
  before_action :set_future_tax,only: [:edit,:update,:show,:destroy]

  def index
    @taxes = FutureTax.where(company_id: params[:company_id])
  end

  def new
    @tax = FutureTax.new
  end

  def create
    @tax = FutureTax.new(tax_params)
    if @tax.save
      redirect_to company_future_taxes_path(@company)
    else
      flash.now[:notice] = "エラーが発生しました。もう一度入力してください。"
      render :new
    end
  end

  def edit
  end

  def update
    @tax.update(tax_params)
  end

  def destroy
    @tax.destroy
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_future_tax
    @tax = FutureTax.find(params[:id])
  end

  def tax_params
    params.require(:future_tax).permit(:sales,:profit_rate,:fix_cost).merge(company_id: @company.id)
  end
end
