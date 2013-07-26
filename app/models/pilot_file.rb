class PilotFile < ActiveRecord::Base
  attr_accessible :description, :name, :pilot_id, :user_id, :file
  
  has_attached_file :file

  belongs_to :pilot, :inverse_of => :pilot_files
  belongs_to :user, :inverse_of => :pilot_files

  validates :name, :file, :pilot_id, :presence => true

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
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('pilot_file', id)
        end
      end

      field :pilot
      field :user
      field :created_at
    end 
    
    edit do 
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :pilot
      field :name
      field :description
      field :file
    end 

  end

end
