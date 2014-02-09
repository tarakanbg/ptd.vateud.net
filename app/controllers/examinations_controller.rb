class ExaminationsController < ApplicationController

  def index
    @examinations = Examination.order("date DESC").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html
    end
  end


end
