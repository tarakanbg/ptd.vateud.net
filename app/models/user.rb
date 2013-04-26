class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :roles
  # attr_accessible :title, :body

  default_scope order('id DESC')

  ROLES = %w[admin examiner instructor]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end


  rails_admin do 
    navigation_label 'Administrative records'  

    edit do
      field :name
      field :email
      field :password
      field :password_confirmation
      field :roles do
        def render
          bindings[:view].render :partial => "roles_partial", :locals => {:user => bindings[:object], :field => self, :form => bindings[:form]}
        end
      end
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
