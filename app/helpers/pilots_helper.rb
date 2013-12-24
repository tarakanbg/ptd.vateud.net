module PilotsHelper
  def upcoming_examinations
    if @pilot.practical_passed == false && @pilot.theory_passed == true && @pilot.examination_id.blank? && @examinations.count > 0
      render 'upcoming_examinations'
    end
  end

   def upcoming_trainings
    if @pilot.upgraded == false && @trainings.count > 0
      render 'upcoming_trainings'
    end
  end
end
