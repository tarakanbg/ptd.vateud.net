class AtcRating < ActiveRecord::Base
  attr_accessible :name, :priority

  has_many :pilots

  validates :name, :presence => true

  rails_admin do 
    navigation_label 'Administrative records'   
    list do
      include_fields :name, :priority
    end    
  end
end
