class Admin::Nested::PiecesController < Admin::BaseController
  before_action :set_fund, only: [:new, :show, :create, :edit, :update]

  def index
    @fund = Fund.includes(:pieces).find params[:fund_id]
  end

  def new
    @piece = @fund.pieces.new
  end

  def show
    @piece = @fund.pieces.find params[:id]
  end

  def create
    @piece = @fund.pieces.new piece_params
    if @piece.save
      redirect_to admin_fund_nested_pieces_path(@fund)
      flash[:success] = t 'flash.piece.success.created'
    else
      render :new
    end
  end

  def update 
    @piece = @fund.pieces.find params[:id]
    if @piece.update_attributes piece_params
      redirect_to admin_fund_nested_pieces_path(@fund)
      flash[:success] = t 'flash.piece.success.updated'
    else
      render :edit
    end
  end

  def edit
    @piece = @fund.pieces.find params[:id]
  end

  private

  def set_fund
    @fund = Fund.find params[:fund_id]
  end

  def piece_params
    params[:piece].permit!
  end

end
