class ExaminationsController < ApplicationController

  def index
    @examinations = Examination.order("date DESC").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html
    end
  end

  def show
    @examination = Examination.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @examination = Examination.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @examination = Examination.find(params[:id])
  end


  def create
    @examination = Examination.new(params[:examination])

    respond_to do |format|
      if @examination.save
        format.html { redirect_to @examination, notice: 'Examination was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @examination = Examination.find(params[:id])

    respond_to do |format|
      if @examination.update_attributes(params[:examination])
        format.html { redirect_to @examination, notice: 'Examination was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @examination = Examination.find(params[:id])
    @examination.destroy

    respond_to do |format|
      format.html { redirect_to examinations_url }
    end
  end
end
