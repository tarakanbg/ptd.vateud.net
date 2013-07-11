class Newbie < ActiveRecord::Base
  attr_accessible :country, :email, :name, :slug, :vatsimid

  extend FriendlyId
  friendly_id :url, use: :slugged

  validates :name, :email, :vatsimid, :presence => true
  validates :name, :length => { :minimum => 4 }
  validates :vatsimid, :length => { :minimum => 6 }
  validates :vatsimid, :numericality => true

  def url
    Digest::SHA1.hexdigest self.name+self.created_at.to_s+self.vatsimid.to_s+"rgy345sjk"
  end

  rails_admin do 
    navigation_label 'Newbie training'   

    list do
      field :id do
        column_width 40
      end
      field :name do
        column_width 170
        pretty_value do          
          id = bindings[:object].id
          name = bindings[:object].name
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('newbie', id)
        end
      end
      field :email do
        column_width 190
      end      
      field :vatsimid do
        label "Vatsim ID"
        column_width 80
      end
      field :country      
    end

    edit do      
      field :name 
      field :email      
      field :vatsimid do
        label "Vatsim ID"       
      end    
      
    end

    show do      
      field :name 
      field :email      
      field :vatsimid do
        label "Vatsim ID"       
      end
      field :country
    end
       
  end

end
