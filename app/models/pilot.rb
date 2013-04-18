class Pilot < ActiveRecord::Base
  attr_accessible :atc_rating_id, :division_id, :email, :examination_id, :instructor_id, :name, :practical_passed, :rating_id, :theory_passed, :upgraded, :vacc, :vatsimid, :token_issued, :theory_score, :practical_score, :notes
  
  belongs_to :atc_rating
  belongs_to :division
  belongs_to :examination, :inverse_of => :pilots
  belongs_to :instructor
  belongs_to :rating

  validates :name, :email, :atc_rating_id, :division_id, :rating_id, :vatsimid, :presence => true

  after_create :send_welcome_mail
  after_save :send_instructor_mail

  def send_welcome_mail
    PtdMailer.welcome_mail_pilot(self).deliver
    PtdMailer.welcome_mail_users(self).deliver
  end

  def send_instructor_mail
    if self.instructor_id_changed? && self.instructor
      PtdMailer.instructor_mail_pilot(self).deliver
      PtdMailer.instructor_mail_instructor(self).deliver
    end
  end

  rails_admin do 
    navigation_label 'Operations records'   

    list do
      field :id do
        column_width 40
      end
      field :name do
        column_width 170
        pretty_value do          
          id = bindings[:object].id
          name = bindings[:object].name
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('pilot', id)
        end
      end
      field :email do
        column_width 190
      end
      field :rating do
        column_width 60
      end
      field :vatsimid do
        label "Vatsim ID"
        column_width 80
      end
      field :division do
        column_width 80
      end
      field :vacc do
        column_width 100
      end
      field :atc_rating
      field :examination
      field :token_issued
      field :theory_passed
      field :theory_score
      field :practical_passed
      field :practical_score
      field :upgraded
    end

    edit do      
      field :name 
      field :email
      field :rating
      field :vatsimid do
        label "Vatsim ID"       
      end
      field :division
      field :vacc
      field :atc_rating
      field :instructor
      field :examination
      field :token_issued
      field :theory_passed
      field :theory_score
      field :practical_passed
      field :practical_score
      field :upgraded
      field :notes
    end

    show do      
      field :name 
      field :email
      field :rating
      field :vatsimid do
        label "Vatsim ID"       
      end
      field :division
      field :vacc
      field :atc_rating
      field :instructor
      field :examination
      field :token_issued
      field :theory_passed
      field :theory_score
      field :practical_passed
      field :practical_score
      field :upgraded
      field :notes
    end
       
  end
end
