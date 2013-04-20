class Examination < ActiveRecord::Base
  attr_accessible :date, :departure_airport, :destination_airport, :examiner_id

  has_many :pilots, :inverse_of => :examination
  belongs_to :examiner

  attr_accessible :pilot_ids

  validates :date, :departure_airport, :destination_airport, :examiner_id, :presence => true

  # after_create :send_initial_mail
  after_save :send_mail

  # def send_initial_mail
  #   PtdMailer.examination_mail_pilots(self).deliver
  #   PtdMailer.examination_mail_instructors(self).deliver
  #   PtdMailer.examination_mail_examiner(self).deliver
  # end

  def self.records_by_day(start)
    records = unscoped.where(created_at: start.beginning_of_day..Time.zone.now)    
    records = records.group('date(created_at)')
    records = records.order('date(created_at)')
    records = records.select('date(created_at) as created_at, count(*) as count')
    records.each_with_object({}) do |record, counts|
      counts[record.created_at.to_date] = record.count
    end
  end

  def send_mail
    if self.date_changed?
      PtdMailer.examination_mail_pilots(self).deliver
      PtdMailer.examination_mail_instructors(self).deliver
      PtdMailer.examination_mail_examiner(self).deliver
    end
  end
  
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
