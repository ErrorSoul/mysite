class Admin::ReleasesController < Admin::BaseController
  before_action :find_release,  only: [:show, :edit, :update, :destroy]

  def index
    @releases = Post.releases.reverse_order
  end

  def new
    @release = Post.new(object_type: 'release')
  end

  def show; end

  def edit; end

  def create
    @release = Post.new post_params
    if @release.save
      redirect_to admin_releases_path
      flash[:success] = t 'flash.post.success.created'
    else
      render :new
    end
  end

  def update
    if @release.update_attributes post_params
      flash[:success] = t 'flash.post.success.updated'
      redirect_to admin_releases_url
    else
      render :edit
    end
  end

  def destroy
    if @release.destroy
      flash[:success] = t 'flash.post.success.deleted'
    else
      flash[:error]   = t 'flash.post.fail.deleted'
    end

    redirect_to admin_releases_path
  end

  private

  def post_params
    params[:post].permit!
  end

  def find_release
    @release = Post.find params[:id]
  end
end
