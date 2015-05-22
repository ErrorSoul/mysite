class ReleasesController < ApplicationController

  def index
    @releases = Post.releases.reverse_order
  end

  def show
    @release = Post.find params[:id]
  end

end
