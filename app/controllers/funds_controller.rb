class FundsController < ApplicationController
  def index
    @page = Page.find_by(name: 'funds')
  end

  def show
    @fund = Fund.find params[:id]
  end
end
