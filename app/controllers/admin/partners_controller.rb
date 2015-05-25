class Admin::PartnersController < Admin::BaseController
  before_action :find_partners,  only: [:show, :edit, :update, :destroy]

  def index
    @page_partners = PartnerPage.all
  end

  def show; end

  def edit; end

  def update
    if @page_partner.update_attributes page_params
      flash[:success] = t 'flash.page_partner.success.updated'
      redirect_to admin_partners_url
    else
      render :edit
    end
  end

  private

  def page_params
    params[:partner_page].permit!
  end

  def find_partners
    @page_partner = PartnerPage.find params[:id]
  end
end
