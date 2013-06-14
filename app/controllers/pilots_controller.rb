class PilotsController < ApplicationController
  # GET /pilots
  # GET /pilots.json
  def index
    @pilots = Pilot.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pilots }
    end
  end

  # GET /pilots/1
  # GET /pilots/1.json
  def show
    @pilot = Pilot.find(params[:id])
    @examinations = Examination.upcoming.where(:rating_id => @pilot.rating_id)
    @trainings = Training.upcoming.where(:rating_id => @pilot.rating_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pilot }
    end
  end

  # GET /pilots/new
  # GET /pilots/new.json
  def new
    @pilot = Pilot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pilot }
    end
  end

  # GET /pilots/1/edit
  def edit
    @pilot = Pilot.find(params[:id])
  end

  # POST /pilots
  # POST /pilots.json
  def create
    if params[:website].blank?
      @pilot = Pilot.new(params[:pilot])

      respond_to do |format|
        if @pilot.save
          format.html { redirect_to @pilot, notice: 'Pilot successfully enrolled!' }
          format.json { render json: @pilot, status: :created, location: @pilot }
        else
          format.html { render action: "new" }
          format.json { render json: @pilot.errors, status: :unprocessable_entity }
        end
      end    
    else
      redirect_to :back
    end
  end

  # PUT /pilots/1
  # PUT /pilots/1.json
  def update
    @pilot = Pilot.find(params[:id])

    respond_to do |format|
      if @pilot.update_attributes(params[:pilot])
        format.html { redirect_to @pilot, notice: 'Pilot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pilots/1
  # DELETE /pilots/1.json
  def destroy
    @pilot = Pilot.find(params[:id])
    @pilot.destroy

    respond_to do |format|
      format.html { redirect_to pilots_url }
      format.json { head :no_content }
    end
  end

  def statistics
    @pilots_total = Pilot.all.count
    @theoretical = Pilot.theoretical.count
    @practical = Pilot.practical.count
    @graduated = Pilot.graduated.count
    @examinations_total = Examination.all.count
    @examiners = Examiner.all.count
    @instructors = Instructor.all.count
    @trainings = Training.all.count
    @p1_count = Rating.find_by_name("P1").pilots.count
    @p2_count = Rating.find_by_name("P2").pilots.count
    @divisions = Division.all
  end

  def examination_join
    @pilot = Pilot.find(params[:id])
    # examination_id = params[:examination_id]
    @pilot.examination_id = params[:examination_id]
    @pilot.save
    PtdMailer.examination_join_mail_pilot(@pilot, params[:examination_id]).deliver
    PtdMailer.examination_join_mail_examiner(@pilot, params[:examination_id]).deliver
    redirect_to :back
  end

  def training_join
    @pilot = Pilot.find(params[:id])
    @training = Training.find(params[:training_id])
    @training.pilots << @pilot
    PtdMailer.training_join_mail_pilot(@pilot, @training).deliver
    PtdMailer.training_join_mail_instructor(@pilot, @training).deliver
    redirect_to :back
  end
end
