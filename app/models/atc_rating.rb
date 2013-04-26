class AtcRating < ActiveRecord::Base
  attr_accessible :name, :priority

  has_many :pilots

  validates :name, :presence => true

  default_scope order('priority ASC')

  rails_admin do 
    navigation_label 'Administrative records'   
    label "ATC rating" 
    label_plural "ATC ratings"
    list do
      include_fields :name, :priority
    end    

    edit do
      exclude_fields :pilots
    end

    list do
      sort_by :priority
      sort_reverse false

      field :id
      field :name do
        column_width 180
        pretty_value do          
          id = bindings[:object].id
          name = bindings[:object].name
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('atc_rating', id)
        end
      end

      field :priority      
    end  

  end
end
