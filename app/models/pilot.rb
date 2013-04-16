class Pilot < ActiveRecord::Base
  attr_accessible :atc_rating_id, :division_id, :email, :examination_id, :instructor_id, :name, :practical_passed, :rating_id, :theory_passed, :upgraded, :vacc, :vatsimid
  
  belongs_to :atc_rating
  belongs_to :division
  belongs_to :examination
  belongs_to :instructor
  belongs_to :rating

  validates :name, :email, :atc_rating_id, :division_id, :rating_id, :vatsimid, :presence => true

  after_create :send_welcome_mail

  def send_welcome_mail
    PtdMailer.welcome_mail_pilot(self).deliver
    PtdMailer.welcome_mail_users(self).deliver
  end

  rails_admin do 
    navigation_label 'Operations records'   
       
  end
end
