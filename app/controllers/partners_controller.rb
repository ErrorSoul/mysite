class PartnersController < ApplicationController

  def show
    @page_partner = PartnerPage.find params[:id]
    
  end
end
