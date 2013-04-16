class Rating < ActiveRecord::Base
  attr_accessible :description, :name, :priority

  has_many :pilots

  validates :name, :presence => true

  default_scope order('priority ASC')

  rails_admin do 
    navigation_label 'Administrative records'   
    list do
      include_fields :name, :priority
    end    

    edit do
      exclude_fields :pilots
    end
  end
end
