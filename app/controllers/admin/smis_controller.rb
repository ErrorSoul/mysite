class Admin::SmisController < Admin::BaseController
  before_action :find_smi,  only: [:show, :edit, :update, :destroy]

  def index
    @smis = Post.smis.reverse_order
  end

  def new
    @smi = Post.new(object_type: 'smi')
  end

  def show; end

  def edit; end

  def create
    @smi = Post.new post_params
    if @smi.save
      redirect_to admin_smis_path
      flash[:success] = t 'flash.post.success.created'
    else
      render :new
    end
  end

  def update
    if @smi.update_attributes post_params
      flash[:success] = t 'flash.post.success.updated'
      redirect_to admin_smis_url
    else
      render :edit
    end
  end

  def destroy
    if @smi.destroy
      flash[:success] = t 'flash.post.success.deleted'
    else
      flash[:error]   = t 'flash.post.fail.deleted'
    end

    redirect_to admin_smis_path
  end

  private

  def post_params
    params[:post].permit!
  end

  def find_smi
    @smi = Post.find params[:id]
  end
end
