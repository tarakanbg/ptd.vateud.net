class Examination < ActiveRecord::Base
  attr_accessible :date, :departure_airport, :destination_airport, :examiner_id

  has_many :pilots, :inverse_of => :examination
  belongs_to :examiner

  # accepts_nested_attributes_for :pilots, :allow_destroy => true
  # attr_accessible :pilots_attributes, :allow_destroy => true 
  attr_accessible :pilot_ids

  validates :date, :departure_airport, :destination_airport, :examiner_id, :presence => true

  rails_admin do 
    navigation_label 'Operations records'   

    edit do
      
    end

    list do
      field :id
      field :date do
        column_width 220
        pretty_value do          
          id = bindings[:object].id
          date = bindings[:object].date
          bindings[:view].link_to "#{date}", bindings[:view].rails_admin.show_path('examination', id)
        end
      end

      field :examiner
      field :departure_airport
      field :destination_airport
    end  
       
  end
end
