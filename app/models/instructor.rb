class Instructor < ActiveRecord::Base
  attr_accessible :email, :name, :vatsimid

  has_many :pilots

  validates :name, :email, :vatsimid, :presence => true

  rails_admin do 
    navigation_label 'Operations records' 

    edit do
      exclude_fields :pilots
    end  
       
  end
end
