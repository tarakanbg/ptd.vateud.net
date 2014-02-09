class TrainingsController < ApplicationController

  def index
    @trainings = Training.order("date DESC").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html
    end
  end

end
