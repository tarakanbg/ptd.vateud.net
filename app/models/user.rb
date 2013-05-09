class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :roles, :has_cert_access
  # attr_accessible :title, :body

  has_many :pilot_files, :inverse_of => :user
  has_many :downloads, :inverse_of => :user

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

  def self.certified_emails
    emails = []
    self.where(:has_cert_access => true).each {|user| emails << user.email}
    emails
  end

  def self.admins
    admins = []   
    User.all.each {|user| admins << user if user.is? :admin} 
    admins
  end

  def self.examiners
    examiners = []   
    User.all.each {|user| examiners << user if user.is? :examiner} 
    examiners
  end

  def self.instructors
    instructors = []   
    User.all.each {|user| instructors << user if user.is? :instructor} 
    instructors
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
      field :has_cert_access 
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
      field :has_cert_access
    end
       
  end

  def self.email_recipients
    emails = []
    User.all.each {|u| emails << u.email}
    emails
  end

  def self.admin_email_recipients
    emails = []
    User.admins.each {|u| emails << u.email}
    emails
  end

  def self.examiner_email_recipients
    emails = []
    User.examiners.each {|u| emails << u.email}
    emails
  end

  def self.instructor_email_recipients
    emails = []
    User.instructors.each {|u| emails << u.email}
    emails
  end


end
