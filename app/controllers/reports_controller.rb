class ReportsController < ApplicationController
  respond_to :json

  def create
    @report = Report.new report_params
    if @report.save
      render json: { report: @report }
     else
      render json: { errors: @report.errors }
    end
  end

 private
 
 def report_params
   params.require(:report).permit(:name, :phone, :firm, :body, :obj_type)
 end

end
