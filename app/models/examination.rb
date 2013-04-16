class Examination < ActiveRecord::Base
  attr_accessible :date, :departure_airport, :destination_airport, :examiner_id

  has_many :pilots
  belongs_to :examiner

  validates :date, :departure_airport, :destination_airport, :examiner_id, :presence => true

  rails_admin do 
    navigation_label 'Operations records'   
       
  end
end
