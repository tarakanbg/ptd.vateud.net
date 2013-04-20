class Instructor < ActiveRecord::Base
  attr_accessible :email, :name, :vatsimid

  default_scope order('id DESC')

  has_many :pilots
  has_many :trainings

  validates :name, :email, :vatsimid, :presence => true

  rails_admin do 
    navigation_label 'Operations records' 

    edit do
      exclude_fields :pilots
    end

    list do
      field :id
      field :name do
        column_width 180
        pretty_value do          
          id = bindings[:object].id
          name = bindings[:object].name
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('instructor', id)
        end
      end

      field :email
      field :vatsimid do
        label "Vatsim ID"
      end
    end  

    edit do
      field :name
      field :email
      field :vatsimid do
        label "Vatsim ID"
      end
    end
       
  end
end
