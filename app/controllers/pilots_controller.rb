class PilotsController < ApplicationController

  def index
    @pilots = Pilot.unscoped.reorder("created_at DESC").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html
    end
  end

  def show
    @pilot = Pilot.find(params[:id])
    @examinations = Examination.upcoming.where(:rating_id => @pilot.rating_id)
    @examinations.each {|exam| @examinations.delete(exam) if @pilot.rating.name != "P1" && exam.pilots.count > 0}
    @trainings = Training.upcoming.where(:rating_id => @pilot.rating_id)

    respond_to do |format|
      format.html
    end
  end

  def new
    @pilot = Pilot.new

    respond_to do |format|
      format.html
    end
  end

  def new_noneud
    @pilot = Pilot.new

    respond_to do |format|
      format.html
    end
  end

  def create
    if params[:website].blank?
      @pilot = Pilot.new(params[:pilot])
      if member = Member.find_by_cid(@pilot.vatsimid)
        @pilot.name = "#{member.firstname} #{member.lastname}"
        @pilot.email = member.email
        @pilot.division_id = 1
        @pilot.vacc = Subdivision.find_by_code(member.subdivision).name unless member.subdivision.blank?
        @pilot.atc_rating_id = member.rating
      else
        if @pilot.name.blank? && @pilot.email.blank?
          render action: "new_noneud" and return
        end
      end

      respond_to do |format|
        if @pilot.save
          format.html { redirect_to @pilot, notice: 'Pilot successfully enrolled!' }
        else
          format.html { render action: "new_noneud" }
        end
      end
    else
      redirect_to :back
    end
  end

  # def update
  #   @pilot = Pilot.find(params[:id])

  #   respond_to do |format|
  #     if @pilot.update_attributes(params[:pilot])
  #       format.html { redirect_to @pilot, notice: 'Pilot was successfully updated.' }
  #     else
  #       format.html { render action: "edit" }
  #     end
  #   end
  # end

  def statistics
    @newbie_count = Rating.find(3).pilots.count
    @pilots_total = Pilot.all.count - @newbie_count
    @theoretical = Pilot.theoretical.count
    @practical = Pilot.practical.count
    @graduated = Pilot.graduated.count - Rating.find(3).pilots.graduated.count
    @examinations_total = Examination.all.count
    @examiners = Examiner.all.count
    @instructors = Instructor.all.count
    @trainings = Training.all.count
    @p1_count = Rating.find_by_name("P1").pilots.count
    @p2_count = Rating.find_by_name("P2").pilots.count
    @p4_count = Rating.find_by_name("P4").pilots.count
    @divisions = Division.all
  end

  def examination_join
    @pilot = Pilot.find(params[:id])
    # examination_id = params[:examination_id]
    @pilot.examination_id = params[:examination_id]
    @pilot.save
    PtdMailer.delay.examination_join_mail_pilot(@pilot, params[:examination_id])
    PtdMailer.delay.examination_join_mail_examiner(@pilot, params[:examination_id])
    redirect_to :back
  end

  def training_join
    @pilot = Pilot.find(params[:id])
    @training = Training.find(params[:training_id])
    @training.pilots << @pilot
    PtdMailer.delay.training_join_mail_pilot(@pilot, @training)
    PtdMailer.delay.training_join_mail_instructor(@pilot, @training)
    redirect_to :back
  end

  def request_reissue
    @pilot = Pilot.find(params[:id])
    PtdMailer.delay.request_reissue(@pilot)
    PtdMailer.delay.request_reissue_pilot(@pilot)
    redirect_to :back
  end
end
