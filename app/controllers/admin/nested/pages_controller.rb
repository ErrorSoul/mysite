class Admin::Nested::PagesController < Admin::BaseController
  def index
    @fund = Fund.includes(:pages).find params[:fund_id]
  end
end
