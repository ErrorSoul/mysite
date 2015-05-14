class GraphsController < ApplicationController
  respond_to :json
  before_action :set_fund, only: [:found, :month1, :month3, :month6, :month12]

  def found
    pieces = @fund.pieces
    if @fund.pieces.length > 1
      @labels = pieces.map(&:date_month)
      @series = pieces.map(&:cost).map(&:to_i)
      render json: { labels: @labels, series: @series }
    else
      render json: { no_graph: true }
    end
  end
  

  def month1
    pieces = @fund.pieces
    if @fund.pieces.length >= 2
      pieces = pieces[-2, 2]
      @labels = pieces.map(&:date_month)
      @series = pieces.map(&:cost).map(&:to_i)
      render json: { labels: @labels, series: @series }
    else
      render json: { no_graph: true }
    end
  end

  def month3
    pieces = @fund.pieces
    if @fund.pieces.length >= 4
      pieces = pieces[-4, 4]
      @labels = pieces.map(&:date_month)
      @series = pieces.map(&:cost).map(&:to_i)
      render json: { labels: @labels, series: @series }
    else
      render json: { no_graph: true }
    end
  end

  def month6
    pieces = @fund.pieces
    if @fund.pieces.length >= 6
      pieces = pieces[-6, 6]
      @labels = pieces.map(&:date_month)
      @series = pieces.map(&:cost).map(&:to_i)
      render json: { labels: @labels, series: @series }
    else
      render json: { no_graph: true }
    end
  end

  def month12
    pieces = @fund.pieces
    if @fund.pieces.length >= 12
      pieces = pieces[-12, 12]
      @labels = pieces.map(&:date_month)
      @series = pieces.map(&:cost).map(&:to_i)
      render json: { labels: @labels, series: @series }
    else
      render json: { no_graph: true }
    end
  end

  private

  def set_fund
    @fund = Fund.includes(:pieces).find params[:fund_id]
  end

end
