class Admin::FundsController < Admin::BaseController
  before_action :find_fund,  only: [:show, :edit, :update, :destroy]

  def index
    @funds = Fund.all
  end

  def show; end

  def edit; end

  def update
    if @fund.update_attributes fund_params
      flash[:success] = t 'flash.funds.success.updated'
      redirect_to admin_funds_url
    else
      render :edit
    end
  end

  private

  def fund_params
    params[:fund].permit!
  end

  def find_fund
    @fund = Fund.find params[:id]
  end
end
