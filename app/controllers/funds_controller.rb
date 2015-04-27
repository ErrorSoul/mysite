class FundsController < ApplicationController

  def show
    @fund = Fund.find params[:id]
  end
end
