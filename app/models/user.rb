class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  default_scope order('id DESC')

  rails_admin do 
    navigation_label 'Administrative records'  

    edit do
      include_fields :name, :email, :password, :password_confirmation
    end

    list do
      field :name do
        column_width 180
        pretty_value do          
          id = bindings[:object].id
          name = bindings[:object].name
          bindings[:view].link_to "#{name}", bindings[:view].rails_admin.show_path('user', id)
        end
      end
      field :email
      field :created_at
    end
       
  end

  def self.email_recipients
    emails = []
    User.all.each {|u| emails << u.email}
    emails
  end


end
