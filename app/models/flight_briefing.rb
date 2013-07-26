class FlightBriefing < ActiveRecord::Base
  attr_accessible :departure, :description, :destination, :name, :file

  has_attached_file :file

  validates :name, :file, :departure, :destination, :presence => true

  attr_accessor :delete_file
  before_validation { self.file.clear if self.delete_file == '1' }

  rails_admin do 

    navigation_label 'Operations records' 

    list do
      field :id do
        column_width 15
      end
      field :name do
        column_width 170
        pretty_value do          
          id = bindings[:object].id
          name = bindings[:object].name
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('flight_briefing', id)
        end
      end

      field :departure
      field :destination
      field :created_at
    end 
    
    edit do       
      field :name
      field :departure
      field :destination
      field :description
      field :file
    end 

  end
end
