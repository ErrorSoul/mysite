class Admin::Nested::PeriodsController < Admin::BaseController
  before_action :set_fund, only: [:new, :show, :create, :edit, :update]

  def index
    @fund = Fund.includes(:periods).find params[:fund_id]
  end

  def new
    @period = @fund.periods.new
  end

  def show
    @period = @fund.periods.find params[:id]
  end

  def create
    @period = @fund.periods.new period_params
    if @period.save
      redirect_to admin_fund_nested_periods_path(@fund)
      flash[:success] = t 'flash.period.success.created'
    else
      render :new
    end
  end

  def update
    @period = @fund.periods.find params[:id]
    if @period.update_attributes period_params
      redirect_to admin_fund_nested_periods_path(@fund)
      flash[:success] = t 'flash.period.success.updated'
    else
      render :edit
    end
  end

  def edit
    @period = @fund.periods.find params[:id]
  end

  private

  def set_fund
    @fund = Fund.find params[:fund_id]
  end

  def period_params
    params[:period].permit!
  end
end
