class Admin::PagesController < Admin::BaseController
  before_action :find_page,  only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show; end

  def edit; end

  def update
    if @page.update_attributes page_params
      flash[:success] = t 'flash.pages.success.updated'
      if @page.fund
        redirect_to admin_fund_nested_pages_path(@page.fund) and return
      end
      redirect_to admin_pages_url
    else
      render :edit
    end
  end

  private

  def page_params
    params[:page].permit!
  end

  def find_page
    @page = Page.find params[:id]
  end
end
