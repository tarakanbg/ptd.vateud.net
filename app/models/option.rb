class Option < ActiveRecord::Base
  attr_accessible :name, :value
  validates :name, :value, presence: true

  rails_admin do
    navigation_label 'Administrative records'
  end
end
