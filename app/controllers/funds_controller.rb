class FundsController < ApplicationController

  def index
    @fund = Fund.first
  end

  def show
    @fund = Fund.find params[:id]
  end
end
