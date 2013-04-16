class Examiner < ActiveRecord::Base
  attr_accessible :email, :name, :vatsimid

  has_many :examinations

  validates :name, :email, :vatsimid, :presence => true

  rails_admin do 
    navigation_label 'Operations records'   
       
  end
end
