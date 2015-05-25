class SmisController < ApplicationController
  def index
    @smis = Post.smis.reverse_order
  end

  def show
    @smi = Post.find params[:id]
  end
end
